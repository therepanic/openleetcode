class Solution {
    fun minElements(nums: IntArray, limit: Int, goal: Int): Int {
        val currentSum = nums.sum().toLong()
        val diff = Math.abs(goal.toLong() - currentSum)
        return ((diff + limit - 1) / limit).toInt()
    }
}
