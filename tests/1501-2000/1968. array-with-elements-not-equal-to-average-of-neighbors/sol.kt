class Solution {
    fun rearrangeArray(nums: IntArray): IntArray {
        nums.sort()
        val res = IntArray(nums.size)
        val mid = (nums.size + 1) / 2
        var j = 0
        for (i in nums.indices step 2) {
            res[i] = nums[j++]
        }
        j = mid
        for (i in 1 until nums.size step 2) {
            res[i] = nums[j++]
        }
        return res
    }
}
