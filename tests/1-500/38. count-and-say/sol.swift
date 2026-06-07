class Solution {
    func countAndSay(_ n: Int) -> String {
        var current = "1"
        if n == 1 {
            return current
        }
        for _ in 1..<n {
            var next = ""
            let chars = Array(current)
            var i = 0
            while i < chars.count {
                var j = i
                while j < chars.count && chars[j] == chars[i] {
                    j += 1
                }
                next += "\(j - i)"
                next.append(chars[i])
                i = j
            }
            current = next
        }
        return current
    }
}
