class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }

        var rev: Int64 = 0
        var num = Int64(x)
        while num != 0 {
            rev = rev * 10 + num % 10
            num /= 10
        }
        return rev == Int64(x)
    }
}
