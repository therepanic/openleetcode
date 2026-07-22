class Solution {
    fun sumFourDivisors(nums: IntArray): Int {
        if (nums.isEmpty()) return 0
        val maxNum = nums.max()
        if (maxNum < 2) return 0

        val sieve = BooleanArray(maxNum + 1) { true }
        if (maxNum >= 0) sieve[0] = false
        if (maxNum >= 1) sieve[1] = false

        var p = 2
        while (p * p <= maxNum) {
            if (sieve[p]) {
                var multiple = p * p
                while (multiple <= maxNum) {
                    sieve[multiple] = false
                    multiple += p
                }
            }
            p++
        }

        var total = 0
        for (x in nums) {
            // p^3 case
            val p3 = Math.round(Math.pow(x.toDouble(), 1.0 / 3)).toInt()
            if (p3 >= 0 && p3 <= maxNum && p3 * p3 * p3 == x && sieve[p3]) {
                total += 1 + p3 + p3 * p3 + x
                continue
            }

            // p * q case
            var i = 2
            while (i * i <= x) {
                if (x % i == 0) {
                    val j = x / i
                    if (i != j && i <= maxNum && j <= maxNum && sieve[i] && sieve[j]) {
                        total += 1 + i + j + x
                    }
                    break
                }
                i++
            }
        }
        return total
    }
}
