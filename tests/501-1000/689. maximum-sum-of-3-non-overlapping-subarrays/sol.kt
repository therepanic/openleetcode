class Solution {
    fun maxSumOfThreeSubarrays(nums: IntArray, k: Int): IntArray {
        val n = nums.size
        var sum1 = nums.slice(0 until k).sum()
        var sum2 = nums.slice(k until 2 * k).sum()
        var sum3 = nums.slice(2 * k until 3 * k).sum()

        var max1 = sum1
        var max12 = sum1 + sum2
        var max123 = sum1 + sum2 + sum3

        var index1 = 0
        var index12_1 = 0
        var index12_2 = k
        var ans = intArrayOf(0, k, 2 * k)

        for (i in 1..n - 3 * k) {
            sum1 = sum1 - nums[i - 1] + nums[i + k - 1]
            sum2 = sum2 - nums[i + k - 1] + nums[i + 2 * k - 1]
            sum3 = sum3 - nums[i + 2 * k - 1] + nums[i + 3 * k - 1]

            if (sum1 > max1) {
                max1 = sum1
                index1 = i
            }

            if (max1 + sum2 > max12) {
                max12 = max1 + sum2
                index12_1 = index1
                index12_2 = i + k
            }

            if (max12 + sum3 > max123) {
                max123 = max12 + sum3
                ans = intArrayOf(index12_1, index12_2, i + 2 * k)
            }
        }

        return ans
    }
}
