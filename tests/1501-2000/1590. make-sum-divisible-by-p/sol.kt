class Solution {
    fun minSubarray(nums: IntArray, p: Int): Int {
        val total = nums.fold(0L) { sum, value -> sum + value.toLong() }
        val modulus = p.toLong()
        val target = total % modulus
        if (target == 0L) return 0

        val mp = mutableMapOf<Long, Int>()
        mp[0] = -1
        var prefix = 0L
        var res = nums.size

        for (i in nums.indices) {
            prefix = (prefix + nums[i].toLong()) % modulus
            val need = (prefix - target + modulus) % modulus

            if (mp.containsKey(need)) {
                res = minOf(res, i - mp[need]!!)
            }

            mp[prefix] = i
        }

        return if (res == nums.size) -1 else res
    }
}
