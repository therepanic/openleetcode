class Solution {
    func lastSubstring(_ s: String) -> String {
        let chars = Array(s)
        var i = 0, j = 1, k = 0
        let n = chars.count
        while j + k < n {
            if chars[i + k] == chars[j + k] {
                k += 1
                continue
            } else if chars[i + k] > chars[j + k] {
                j = j + k + 1
            } else {
                i = max(i + k + 1, j)
                j = i + 1
            }
            k = 0
        }
        return String(chars[i...])
    }
}
