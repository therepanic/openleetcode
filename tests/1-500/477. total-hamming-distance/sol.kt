class Solution {
    fun totalHammingDistance(nums: IntArray): Int {
        var total = 0
        val n = nums.size
        for (i in 0 until 32) {
            var ones = 0
            for (num in nums) {
                ones += (num shr i) and 1
            }
            total += ones * (n - ones)
        }
        return total
    }
}
