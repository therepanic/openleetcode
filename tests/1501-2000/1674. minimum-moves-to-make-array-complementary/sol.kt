class Solution {
    fun minMoves(nums: IntArray, limit: Int): Int {
        val n = nums.size
        val diff = IntArray(2 * limit + 2)
        
        for (i in 0 until n / 2) {
            val a = nums[i]
            val b = nums[n - 1 - i]
            val low = minOf(a, b) + 1
            val high = maxOf(a, b) + limit
            val total = a + b
            
            diff[2] += 2
            diff[2 * limit + 1] -= 2
            
            diff[low] -= 1
            diff[high + 1] += 1
            
            diff[total] -= 1
            diff[total + 1] += 1
        }
        
        var ans = Int.MAX_VALUE
        var moves = 0
        for (target in 2..2 * limit) {
            moves += diff[target]
            ans = minOf(ans, moves)
        }
        
        return ans
    }
}
