class Solution {
    fun maxWidthRamp(nums: IntArray): Int {
        val n = nums.size
        val right_max = IntArray(n)
        right_max[n - 1] = nums[n - 1]
        
        for (i in n - 2 downTo 0) {
            right_max[i] = maxOf(nums[i], right_max[i + 1])
        }
        
        var i = 0
        var j = 0
        var result = 0
        while (j < n) {
            if (nums[i] <= right_max[j]) {
                result = maxOf(result, j - i)
                j++
            } else {
                i++
            }
        }
        
        return result
    }
}
