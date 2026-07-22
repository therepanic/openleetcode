class Solution {
    fun constrainedSubsetSum(nums: IntArray, k: Int): Int {
        val q = java.util.ArrayDeque<Pair<Int, Int>>()
        var res = Int.MIN_VALUE
        for (i in nums.indices) {
            val num = nums[i]
            val total = if (q.isEmpty()) num else num + q.first().second
            res = maxOf(res, total)
            while (q.isNotEmpty() && total >= q.last().second) {
                q.removeLast()
            }
            if (total > 0) {
                q.addLast(Pair(i, total))
            }
            if (q.isNotEmpty() && q.first().first == i - k) {
                q.removeFirst()
            }
        }
        return res
    }
}
