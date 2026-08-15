class Solution {
    fun minOperations(nums: IntArray, x: Int): Int {
        var sub_sum = nums.sum() - x
        val n = nums.size
        var opes = n
        if (sub_sum == 0) return n
        var l = 0
        var r = 0
        var sld_sum = 0
        
        while (r < n) {
            if (sld_sum == sub_sum) {
                opes = minOf(opes, n - (r - l))
            }
            sld_sum += nums[r]
            while (l < r && sld_sum > sub_sum) {
                sld_sum -= nums[l]
                l++
            }
            r++
        }

        if (sld_sum == sub_sum) {
            opes = minOf(opes, n - (r - l))
        }

        return if (opes == n) -1 else opes
    }
}
