class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var num = n
        if num <= 0 {
            return false
        }
        while num % 3 == 0 {
            num /= 3
        }
        return num == 1
    }
}
