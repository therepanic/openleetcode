class Solution {
    func longestBeautifulSubstring(_ word: String) -> Int {
        let chars = Array(word)
        let n = chars.count
        var i = 0
        var length = 0

        while i < n {
            if chars[i] != "a" {
                i += 1
                continue
            }

            var j = i
            var unique = 1
            while j + 1 < n && chars[j + 1] >= chars[j] {
                if chars[j + 1] != chars[j] {
                    unique += 1
                }
                j += 1
            }

            if unique == 5 {
                length = max(length, j - i + 1)
            }

            i = j + 1
        }

        return length
    }
}
