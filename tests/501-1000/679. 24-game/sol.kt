class Solution {
    private val eps = 1e-6

    fun judgePoint24(cards: IntArray): Boolean {
        val nums = cards.map { it.toDouble() }.toMutableList()
        return dfs(nums)
    }

    private fun dfs(nums: MutableList<Double>): Boolean {
        if (nums.size == 1) {
            return Math.abs(nums[0] - 24.0) < eps
        }

        for (i in nums.indices) {
            for (j in nums.indices) {
                if (i == j) continue

                val nextNums = nums.filterIndexed { index, _ -> index != i && index != j }.toMutableList()
                val a = nums[i]
                val b = nums[j]

                val candidates = mutableListOf(a + b, a - b, b - a, a * b)
                if (Math.abs(b) > eps) candidates.add(a / b)
                if (Math.abs(a) > eps) candidates.add(b / a)

                for (value in candidates) {
                    nextNums.add(value)
                    if (dfs(nextNums)) return true
                    nextNums.removeAt(nextNums.size - 1)
                }
            }
        }
        return false
    }
}
