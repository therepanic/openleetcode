class Solution {
    fun smallerNumbersThanCurrent(nums: IntArray): IntArray {
        val allNums = IntArray(101)
        val res = IntArray(nums.size)

        for (v in nums) {
            allNums[v]++
        }

        for (v in 1..100) {
            allNums[v] += allNums[v - 1]
        }

        for (i in nums.indices) {
            val v = nums[i]
            if (v == 0) {
                res[i] = 0
            } else {
                res[i] = allNums[v - 1]
            }
        }
        return res
    }
}
