class Solution {
    fun maximumUniqueSubarray(nums: IntArray): Int {
        var res = 0
        var curSum = 0
        var start = 0
        val k = 10001
        val isPresent = BooleanArray(k)

        for (end in nums.indices) {
            while (isPresent[nums[end]]) {
                isPresent[nums[start]] = false
                curSum -= nums[start]
                start++
            }

            isPresent[nums[end]] = true
            curSum += nums[end]

            res = maxOf(res, curSum)
        }

        return res
    }
}
