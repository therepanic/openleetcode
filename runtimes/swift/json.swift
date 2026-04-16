func toJson(_ obj: Any?) -> String {
    var seen: [ObjectIdentifier] = []
    return encode(obj, &seen)
}

private func encode(_ obj: Any?, _ seen: inout [ObjectIdentifier]) -> String {
    guard let obj = obj else { return "null" }

    if let b = obj as? Bool { return b ? "true" : "false" }
    if let n = obj as? Int { return "\(n)" }
    if let n = obj as? Double {
        if n.isNaN || n.isInfinite { return "null" }
        return "\(n)" 
    }
    if let s = obj as? String { return quote(s) }
    if let d = obj as? Date { return quote(ISO8601DateFormatter().string(from: d)) }

    let ref = obj as AnyObject
    let oid = ObjectIdentifier(ref)
    guard !seen.contains(oid) else {
        fatalError("Cycle detected while encoding to json")
    }
    seen.append(oid)
    defer { seen.removeAll { $0 == oid } }

    if let dict = obj as? [String: Any?] {
        let parts = dict.map { "\(quote($0.key)):\(encode($0.value, &seen))" }
        return "{\(parts.joined(separator: ","))}"
    }

    if let arr = obj as? [Any?] {
        return "[\(arr.map { encode($0, &seen) }.joined(separator: ","))]"
    }

    let mirror = Mirror(reflecting: obj)
    if mirror.children.isEmpty {
        return quote("\(obj)")
    }
    let parts = mirror.children.compactMap { child -> String? in
        guard let label = child.label, !label.hasPrefix("_") else { return nil }
        return "\(quote(label)):\(encode(child.value, &seen))"
    }
    return "{\(parts.joined(separator: ","))}"
}

private func quote(_ s: String) -> String {
    var out = "\""
    for ch in s.unicodeScalars {
        switch ch.value {
        case 0x22: out += "\\\""
        case 0x5C: out += "\\\\"
        case 0x08: out += "\\b"
        case 0x0C: out += "\\f"
        case 0x0A: out += "\\n"
        case 0x0D: out += "\\r"
        case 0x09: out += "\\t"
        default:
            if ch.value < 0x20 {
                out += String(format: "\\u%04x", ch.value)
            } else {
                out += String(ch)
            }
        }
    }
    out += "\""
    return out
}
