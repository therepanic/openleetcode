class Solution {
    func splitString(_ s: String) -> Bool {
        let chars = Array(s)
        func normalized(_ value: String) -> String {
            let trimmed = String(value.drop { $0 == "0" })
            return trimmed.isEmpty ? "0" : trimmed
        }
        func decrement(_ value: String) -> String? {
            let digits = Array(value.utf8)
            if normalized(value) == "0" { return nil }
            var result = digits
            var i = result.count - 1
            while result[i] == 48 {
                result[i] = 57
                i -= 1
            }
            result[i] -= 1
            return normalized(String(bytes: result, encoding: .utf8)!)
        }
        func dfs(_ index: Int, _ prev: String, _ count: Int) -> Bool {
            if index == chars.count {
                return count >= 2
            }
            var current = ""
            for i in index..<chars.count {
                current.append(chars[i])
                let curr = normalized(current)
                if let expected = decrement(prev), curr == expected {
                    if dfs(i + 1, curr, count + 1) {
                        return true
                    }
                }
            }
            return false
        }
        if chars.count < 2 { return false }
        for i in 0..<(chars.count - 1) {
            let first = normalized(String(chars[0...i]))
            if dfs(i + 1, first, 1) { return true }
        }
        return false
    }
}
