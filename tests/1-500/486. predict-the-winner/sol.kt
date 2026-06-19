class Solution {
    fun predictTheWinner(nums: IntArray): Boolean {
        fun helper(left: Int, right: Int): Int {
            if (left == right) {
                return nums[left]
            }
            return maxOf(nums[left] - helper(left + 1, right), 
                        nums[right] - helper(left, right - 1))
        }
        return helper(0, nums.size - 1) >= 0
    }
}
