public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func toTreeNode(_ arr: [Int?]) -> TreeNode? {
    guard !arr.isEmpty, let first = arr[0] else { return nil }
    let root = TreeNode(first)
    var queue = [root]
    var i = 1
    var qIdx = 0
    while i < arr.count {
        let node = queue[qIdx]
        qIdx += 1
        if i < arr.count, let leftVal = arr[i] {
            let leftNode = TreeNode(leftVal)
            node.left = leftNode
            queue.append(leftNode)
        }
        i += 1
        if i < arr.count, let rightVal = arr[i] {
            let rightNode = TreeNode(rightVal)
            node.right = rightNode
            queue.append(rightNode)
        }
        i += 1
    }
    return root
}

func treeNodeToArray(_ root: TreeNode?) -> [Int?] {
    var res = [Int?]()
    guard let root = root else { return res }
    var queue: [TreeNode?] = [root]
    var qIdx = 0
    while qIdx < queue.count {
        if let node = queue[qIdx] {
            res.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        } else {
            res.append(nil)
        }
        qIdx += 1
    }
    while res.last == nil { res.removeLast() }
    return res
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func toListNode(_ arr: [Int]) -> ListNode? {
    if arr.isEmpty { return nil }
    let head = ListNode(arr[0])
    var cur = head
    for i in 1..<arr.count {
        cur.next = ListNode(arr[i])
        cur = cur.next!
    }
    return head
}

func listNodeToArray(_ head: ListNode?) -> [Int] {
    var res = [Int]()
    var cur = head
    while cur != nil {
        res.append(cur!.val)
        cur = cur!.next
    }
    return res
}

func toJson(_ obj: Any?) -> String {
    var seen: [ObjectIdentifier] = []
    return "\n" + encode(obj, &seen)
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
