class Solution {
    fun specialArray(nums: IntArray): Int {
        val ans = IntArray(nums.size + 1)
        for (i in 0..nums.size) {
            var count = 0
            for (ele in nums) {
                if (i <= ele) count++
            }
            ans[i] = count
            if (ans[i] == i) return i
        }
        return -1
    }
}
