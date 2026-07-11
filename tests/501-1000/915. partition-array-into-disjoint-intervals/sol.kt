class Solution {
    fun partitionDisjoint(nums: IntArray): Int {
        val n = nums.size
        val prefixMax = IntArray(n)
        prefixMax[0] = nums[0]
        for (i in 1 until n) {
            prefixMax[i] = maxOf(prefixMax[i-1], nums[i])
        }
        
        val suffixMin = IntArray(n)
        suffixMin[n-1] = nums[n-1]
        for (i in n-2 downTo 0) {
            suffixMin[i] = minOf(suffixMin[i+1], nums[i])
        }
        
        for (i in 0 until n-1) {
            if (prefixMax[i] <= suffixMin[i+1]) {
                return i + 1
            }
        }
        return -1
    }
}
