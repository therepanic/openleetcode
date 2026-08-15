class Solution {

    fun maxProductDifference(nums: IntArray): Int {

        nums.sort()
        return (nums[nums.size-1] * nums[nums.size-2]) - (nums[0] * nums[1])

    }

}
