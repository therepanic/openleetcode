class Solution {
    fun minPairSum(nums: IntArray): Int {
        nums.sort()
        var maxSum = 0
        var l = 0
        var r = nums.size - 1
        while (l < r) {
            maxSum = maxOf(maxSum, nums[l] + nums[r])
            l++
            r--
        }
        return maxSum
    }
}
