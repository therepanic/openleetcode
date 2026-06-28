class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num == 1 {
            return false
        }
        var count = 1
        var i = 2
        while i * i <= num {
            if num % i == 0 {
                count += i + num / i
            }
            i += 1
        }
        return num == count
    }
}
