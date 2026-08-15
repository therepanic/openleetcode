class Solution {
    func minInsertions(_ s: String) -> Int {
        var stack: [Character] = []
        var count = 0
        var i = 0
        let chars = Array(s)
        
        while i < chars.count {
            if chars[i] == "(" {
                stack.append("(")
            } else {
                if stack.isEmpty {
                    if i != chars.count - 1 && chars[i + 1] == ")" {
                        count += 1
                        i += 1
                    } else {
                        count += 2
                    }
                } else {
                    if i != chars.count - 1 && chars[i + 1] == ")" {
                        stack.removeLast()
                        i += 1
                    } else {
                        count += 1
                        stack.removeLast()
                    }
                }
            }
            i += 1
        }
        
        return count + stack.count * 2
    }
}
