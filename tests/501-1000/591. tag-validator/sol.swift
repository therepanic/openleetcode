class Solution {
    func isValid(_ code: String) -> Bool {
        let tagPat = try! NSRegularExpression(pattern: "^<(/?)([A-Z]{1,9})>$")
        let openCdata = "<![CDATA["
        let closeCdata = "]]>"
        var stack = [String]()
        var firstTagSeen = false
        var i = code.startIndex
        let j = code.endIndex
        
        while i <= j {
            guard let s = code[i...].firstIndex(of: "<") else {
                break
            }
            guard let e = code[s...].firstIndex(of: ">"), e > s else {
                return false
            }
            
            let candidate = String(code[s...e])
            let range = NSRange(location: 0, length: candidate.count)
            if let m = tagPat.firstMatch(in: candidate, range: range) {
                let tag = (candidate as NSString).substring(with: m.range(at: 2))
                let slash = (candidate as NSString).substring(with: m.range(at: 1))
                
                if slash.isEmpty {
                    if !firstTagSeen && s != code.startIndex {
                        return false
                    }
                    stack.append(tag)
                    firstTagSeen = true
                } else {
                    if stack.isEmpty || stack.last != tag {
                        return false
                    }
                    if stack.count == 1 && e != code.index(before: code.endIndex) {
                        return false
                    }
                    stack.removeLast()
                }
                
                i = code.index(after: e)
            } else if code[s...].hasPrefix(openCdata) {
                let start = code.index(s, offsetBy: openCdata.count)
                guard let k = code[start...].range(of: closeCdata) else {
                    return false
                }
                i = code.index(k.upperBound, offsetBy: 0)
            } else {
                return false
            }
        }
        
        return stack.isEmpty && firstTagSeen
    }
}
