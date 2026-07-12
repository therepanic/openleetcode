class Solution {
    fun sortArrayByParity(nums: IntArray): IntArray {
        var left = 0
        for (i in nums.indices) {
            if (nums[i] % 2 == 0) {
                val temp = nums[left]
                nums[left] = nums[i]
                nums[i] = temp
                left++
            }
        }
        return nums
    }
}
