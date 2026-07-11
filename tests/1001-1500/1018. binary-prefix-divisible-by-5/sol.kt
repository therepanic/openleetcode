class Solution {
    fun prefixesDivBy5(nums: IntArray): List<Boolean> {
        val ans = mutableListOf<Boolean>()
        var v = 0
        for (bit in nums) {
            v = (v * 2 + bit) % 5
            ans.add(v == 0)
        }
        return ans
    }
}
