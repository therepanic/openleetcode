class Solution {
    func longestDecomposition(_ text: String) -> Int {
        let chars = Array(text)
        var i = 0, j = chars.count - 1, n = 0, count = 0
        while i <= j {
            if chars[i] == chars[j] {
                if String(chars[i...i+n]) == String(chars[j...j+n]) {
                    count += 2
                    i += n + 1
                    j -= 1
                    n = 0
                    continue
                }
            }
            j -= 1
            n += 1
        }
        return i == j + 1 ? count : count - 1
    }
}
