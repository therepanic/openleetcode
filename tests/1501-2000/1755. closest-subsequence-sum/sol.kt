class Solution {
    fun minAbsDifference(nums: IntArray, goal: Int): Int {
        fun sums(values: List<Int>): MutableList<Int> {
            val result = mutableListOf(0)
            for (value in values) {
                val size = result.size
                for (i in 0 until size) {
                    result.add(result[i] + value)
                }
            }
            return result
        }
        val mid = nums.size / 2
        val left = sums(nums.take(mid)).sorted()
        val right = sums(nums.drop(mid)).sorted()
        var answer = Math.abs(goal)
        var j = right.size - 1
        for (value in left) {
            while (j > 0 && right[j - 1] >= goal - value) {
                j--
            }
            answer = Math.min(answer, Math.abs(value + right[j] - goal))
            if (j > 0) {
                answer = Math.min(answer, Math.abs(value + right[j - 1] - goal))
            }
        }
        return answer
    }
}
