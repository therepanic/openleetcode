class Solution {
    fun maxSlidingWindow(nums: IntArray, k: Int): IntArray {
        val res = IntArray(nums.size - k + 1)
        val q = ArrayDeque<Int>()
        for (i in nums.indices) {
            val num = nums[i]
            while (q.isNotEmpty() && q.last() < num) {
                q.removeLast()
            }
            q.addLast(num)
            if (i >= k && nums[i - k] == q.first()) {
                q.removeFirst()
            }
            if (i >= k - 1) {
                res[i - k + 1] = q.first()
            }
        }
        return res
    }
}
