class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        
        func isPalindrome(_ l: Int, _ r: Int) -> Bool {
            var left = l
            var right = r
            while left < right {
                if chars[left] != chars[right] {
                    return false
                }
                left += 1
                right -= 1
            }
            return true
        }
        
        var left = 0
        var right = chars.count - 1
        while left < right {
            if chars[left] != chars[right] {
                return isPalindrome(left + 1, right) || isPalindrome(left, right - 1)
            }
            left += 1
            right -= 1
        }
        return true
    }
}
