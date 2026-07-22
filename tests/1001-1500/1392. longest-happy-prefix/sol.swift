class Solution {
    func longestPrefix(_ s: String) -> String {
        let n = s.count
        let chars = Array(s)
        var prefix = [Int](repeating: 0, count: n)
        var matched = 0
        for i in 1..<n {
            while matched > 0 && chars[i] != chars[matched] {
                matched = prefix[matched - 1]
            }
            if chars[i] == chars[matched] {
                matched += 1
            }
            prefix[i] = matched
        }
        return String(chars[0..<prefix[n - 1]])
    }
}
