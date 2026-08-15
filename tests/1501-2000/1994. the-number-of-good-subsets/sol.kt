class Solution {
    fun numberOfGoodSubsets(nums: IntArray): Int {
        val mod = 1_000_000_007L
        val primes = intArrayOf(2,3,5,7,11,13,17,19,23,29)
        val freq = IntArray(31)
        for (x in nums) freq[x]++
        val masks = IntArray(31)
        for (x in 2..30) {
            var y = x; var mask = 0; var ok = true
            for (b in 0 until 10) {
                val p = primes[b]
                if (y % (p * p) == 0) { ok = false; break }
                if (y % p == 0) mask = mask or (1 shl b)
            }
            if (ok) masks[x] = mask
        }
        val dp = LongArray(1024); dp[0] = 1
        for (x in 2..30) {
            val mask = masks[x]
            if (mask == 0 || freq[x] == 0) continue
            for (state in 1023 downTo 0) {
                if (state and mask == 0) {
                    val next = state or mask
                    dp[next] = (dp[next] + dp[state] * freq[x]) % mod
                }
            }
        }
        var ans = 0L
        for (state in 1 until 1024) ans = (ans + dp[state]) % mod
        repeat(freq[1]) { ans = ans * 2 % mod }
        return ans.toInt()
    }
}
