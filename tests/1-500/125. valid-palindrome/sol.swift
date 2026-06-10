class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1
        while left < right {
            while left < right && !chars[left].isLetter && !chars[left].isNumber { left += 1 }
            while left < right && !chars[right].isLetter && !chars[right].isNumber { right -= 1 }
            if String(chars[left]).lowercased() != String(chars[right]).lowercased() { return false }
            left += 1
            right -= 1
        }
        return true
    }
}
