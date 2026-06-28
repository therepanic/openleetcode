class Solution {
    fun findMaxLength(nums: IntArray): Int {
        var count = 0
        var maxLength = 0
        val countMap = mutableMapOf(0 to -1)

        for (i in nums.indices) {
            if (nums[i] == 0) {
                count--
            } else {
                count++
            }

            if (countMap.containsKey(count)) {
                maxLength = maxOf(maxLength, i - countMap[count]!!)
            } else {
                countMap[count] = i
            }
        }

        return maxLength
    }
}
