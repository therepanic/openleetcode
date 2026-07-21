class Solution {
    func breakPalindrome(_ palindrome: String) -> String {
        if palindrome.count == 1 { return "" }
        var chars = Array(palindrome)
        for i in 0..<chars.count / 2 {
            if chars[i] != "a" {
                chars[i] = "a"
                return String(chars)
            }
        }
        chars[chars.count - 1] = "b"
        return String(chars)
    }
}
