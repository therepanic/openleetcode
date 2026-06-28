class Solution {
    fun findShortestSubArray(nums: IntArray): Int {
        val left = mutableMapOf<Int, Int>()
        val right = mutableMapOf<Int, Int>()
        val count = mutableMapOf<Int, Int>()
        
        for (i in nums.indices) {
            val x = nums[i]
            if (!left.containsKey(x)) {
                left[x] = i
            }
            right[x] = i
            count[x] = count.getOrDefault(x, 0) + 1
        }
        
        var ans = nums.size
        val degree = count.values.maxOrNull() ?: 0
        
        for ((x, c) in count) {
            if (c == degree) {
                ans = minOf(ans, right[x]!! - left[x]!! + 1)
            }
        }
        
        return ans
    }
}
