class Solution {
    fun wiggleMaxLength(nums: IntArray): Int {
        if (nums.size < 2) return nums.size

        var up = 1
        var down = 1

        for (i in 1 until nums.size) {
            if (nums[i] > nums[i - 1]) {
                up = down + 1
            } else if (nums[i] < nums[i - 1]) {
                down = up + 1
            }
        }

        return maxOf(up, down)
    }
}
