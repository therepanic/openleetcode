class Solution {
    fun findDuplicates(nums: IntArray): List<Int> {
        val r = mutableListOf<Int>()
        for (x in nums) {
            val idx = Math.abs(x) - 1
            if (nums[idx] < 0) {
                r.add(Math.abs(x))
            } else {
                nums[idx] = -nums[idx]
            }
        }
        return r
    }
}
