class Solution {
    func checkPowersOfThree(_ n: Int) -> Bool {
        var num = n
        while num > 0 {
            if num % 3 == 2 {
                return false
            }
            num /= 3
        }
        return true
    }
}
