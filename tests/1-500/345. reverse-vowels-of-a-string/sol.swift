class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels = Set("aeiouAEIOU")
        var chars = Array(s)
        var i = 0, j = chars.count - 1
        while i < j {
            while i < j && !vowels.contains(chars[i]) {
                i += 1
            }
            while i < j && !vowels.contains(chars[j]) {
                j -= 1
            }
            chars.swapAt(i, j)
            i += 1
            j -= 1
        }
        return String(chars)
    }
}
