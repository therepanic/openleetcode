class Solution {
    fun minSubsequence(nums: IntArray): List<Int> {
        nums.sort()
        val v = mutableListOf<Int>()
        var l = nums.size
        var sumV = 0
        var sumRem = nums.sum()
        while (sumV <= sumRem) {
            l--
            sumV += nums[l]
            sumRem -= nums[l]
            v.add(nums[l])
        }
        return v
    }
}
