class Solution {
    fun findDisappearedNumbers(nums: IntArray): List<Int> {
        for (i in nums.indices) {
            val idx = Math.abs(nums[i]) - 1
            if (nums[idx] > 0) {
                nums[idx] *= -1
            }
        }
        val res = mutableListOf<Int>()
        for (i in nums.indices) {
            if (nums[i] > 0) {
                res.add(i + 1)
            }
        }
        return res
    }
}
