class Solution {
    fun mostCompetitive(nums: IntArray, k: Int): IntArray {
        val stack = mutableListOf<Int>()
        val n = nums.size
        for (i in 0 until n) {
            while (stack.isNotEmpty() && stack.last() > nums[i]) {
                if (n - 1 - i >= k - stack.size) {
                    stack.removeAt(stack.size - 1)
                } else {
                    break
                }
            }
            stack.add(nums[i])
        }
        return stack.take(k).toIntArray()
    }
}
