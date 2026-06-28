class Solution {
    fun findLength(nums1: IntArray, nums2: IntArray): Int {
        val P = 113
        val MOD = 1_000_000_007
        val Pinv = modPow(P.toLong(), MOD - 2, MOD).toInt()

        fun check(guess: Int): Boolean {
            if (guess == 0) return true

            val hashes = mutableMapOf<Long, MutableList<Int>>()

            // nums1
            var h = 0L
            var power = 1L
            for (i in nums1.indices) {
                h = (h + nums1[i] * power) % MOD
                if (i < guess - 1) {
                    power = (power * P) % MOD
                } else {
                    val start = i - (guess - 1)
                    hashes.getOrPut(h) { mutableListOf() }.add(start)
                    h = (h - nums1[start] + MOD) * Pinv % MOD
                }
            }

            // nums2
            h = 0L
            power = 1L
            for (i in nums2.indices) {
                h = (h + nums2[i] * power) % MOD
                if (i < guess - 1) {
                    power = (power * P) % MOD
                } else {
                    val start = i - (guess - 1)
                    hashes[h]?.let { list ->
                        for (idx in list) {
                            if (nums1.sliceArray(idx until idx + guess) contentEquals 
                                nums2.sliceArray(start until start + guess)) {
                                return true
                            }
                        }
                    }
                    h = (h - nums2[start] + MOD) * Pinv % MOD
                }
            }
            return false
        }

        var lo = 0
        var hi = minOf(nums1.size, nums2.size) + 1
        while (lo < hi) {
            val mi = (lo + hi) / 2
            if (check(mi)) {
                lo = mi + 1
            } else {
                hi = mi
            }
        }
        return lo - 1
    }

    private fun modPow(base: Long, exp: Int, mod: Int): Long {
        var b = base % mod
        var e = exp
        var res = 1L
        while (e > 0) {
            if (e and 1 == 1) res = (res * b) % mod
            b = (b * b) % mod
            e = e shr 1
        }
        return res
    }
}
