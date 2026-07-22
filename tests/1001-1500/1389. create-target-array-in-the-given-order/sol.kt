class Solution {
    fun createTargetArray(nums: IntArray, index: IntArray): IntArray {
        val target = mutableListOf<Int>()
        for (i in nums.indices) {
            target.add(index[i], nums[i])
        }
        return target.toIntArray()
    }
}
