class Solution {
    fun checkPerfectNumber(num: Int): Boolean {
        if (num == 1)
            return false
        var count = 1
        var i = 2
        while (i * i <= num) {
            if (num % i == 0) {
                count += i + num / i
            }
            i++
        }
        return num == count
    }
}
