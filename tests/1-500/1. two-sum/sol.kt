class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {
        val seen = mutableMapOf<Int, Int>()
        for (i in nums.indices) {
            val need = target - nums[i]
            val j = seen[need]
            if (j != null) {
                return intArrayOf(j, i)
            }
            seen[nums[i]] = i
        }
        return intArrayOf()
    }
}
