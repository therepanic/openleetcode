class Solution {
    fun minStartValue(nums: IntArray): Int {
        var curr = 0
        var ans = 0
        for (i in nums) {
            curr += i
            if (curr < ans) {
                ans = curr
            }
        }
        return maxOf(ans, 1 - ans)
    }
}
