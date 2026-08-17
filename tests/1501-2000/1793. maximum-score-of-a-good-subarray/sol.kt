class Solution {
    fun maximumScore(nums: IntArray, k: Int): Int {
        val n = nums.size
        var i = k
        var j = k
        var curMin = nums[k]
        var res = curMin

        while (i > 0 || j < n - 1) {
            if (i == 0) {
                j++
            } else if (j == n - 1) {
                i--
            } else if (nums[i - 1] >= nums[j + 1]) {
                i--
            } else {
                j++
            }
            curMin = minOf(curMin, nums[i], nums[j])
            res = maxOf(res, curMin * (j - i + 1))
        }

        return res
    }
}
