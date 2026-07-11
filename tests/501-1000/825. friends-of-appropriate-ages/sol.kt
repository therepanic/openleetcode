class Solution {
    fun numFriendRequests(ages: IntArray): Int {
        val cnt = IntArray(121)
        for (age in ages) {
            cnt[age]++
        }
        val pre = IntArray(122)
        for (i in 0 until 121) {
            pre[i + 1] = pre[i] + cnt[i]
        }
        var ans = 0
        for (age in 15 until 121) {
            if (cnt[age] > 0) {
                val lower = (age * 0.5 + 7).toInt()
                val total = pre[age + 1] - pre[lower + 1]
                ans += cnt[age] * (total - 1)
            }
        }
        return ans
    }
}
