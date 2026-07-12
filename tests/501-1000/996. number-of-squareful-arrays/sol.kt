class Solution {
    private lateinit var nums: IntArray
    private var n: Int = 0

    fun numSquarefulPerms(nums: IntArray): Int {
        this.nums = nums.sortedArray()
        this.n = nums.size
        return backtrack(0, mutableListOf())
    }

    private fun isSquareful(currNums: List<Int>, num: Int): Boolean {
        if (currNums.isEmpty()) return true
        val prevNum = currNums.last()
        val pairSum = prevNum + num
        if (pairSum < 0) return false
        val sqrtN = kotlin.math.sqrt(pairSum.toDouble()).toInt()
        return sqrtN * sqrtN == pairSum
    }

    private fun backtrack(numsMask: Int, currNums: MutableList<Int>): Int {
        if (numsMask != 0 && currNums.size == n) return 1
        var numSquarefulPerms = 0
        for (idx in 0 until n) {
            val num = nums[idx]
            if (idx > 0 && nums[idx] == nums[idx - 1] && (numsMask and (1 shl (idx - 1))) == 0) {
                continue
            }
            if ((numsMask and (1 shl idx)) == 0 && isSquareful(currNums, num)) {
                currNums.add(num)
                numSquarefulPerms += backtrack(numsMask or (1 shl idx), currNums)
                currNums.removeAt(currNums.size - 1)
            }
        }
        return numSquarefulPerms
    }
}
