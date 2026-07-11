class Solution {
    fun subarraysDivByK(nums: IntArray, k: Int): Int {
        var s = 0
        var res = 0
        val hs = mutableMapOf(0 to 1)
        for (num in nums) {
            s += num
            var rem = s % k
            if (rem < 0) rem += k
            res += hs.getOrDefault(rem, 0)
            hs[rem] = hs.getOrDefault(rem, 0) + 1
        }
        return res
    }
}
