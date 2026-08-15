class Solution {
    fun buildArray(nums: IntArray): IntArray {
        for (i in nums.indices) {
            nums[i] += (1024 * (nums[nums[i]] % 1024))
        }
        
        for (i in nums.indices) {
            nums[i] /= 1024
        }
        
        return nums
    }
}
