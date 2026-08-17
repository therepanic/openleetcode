class Solution {
    fun minimumIncompatibility(nums: IntArray, k: Int): Int {
        val n = nums.size
        val sz = n / k
        
        val counts = mutableMapOf<Int, Int>()
        for (value in nums) counts[value] = (counts[value] ?: 0) + 1
        if (counts.values.any { it > k }) return -1
        
        nums.sort()
        
        val validSubsets = mutableMapOf<Int, Int>()
        for (mask in 0 until (1 shl n)) {
            if (Integer.bitCount(mask) == sz) {
                val subset = mutableListOf<Int>()
                for (i in 0 until n) {
                    if (((mask shr i) and 1) == 1) {
                        subset.add(nums[i])
                    }
                }
                if (subset.toSet().size == sz) {
                    validSubsets[mask] = subset.max()!! - subset.min()!!
                }
            }
        }
        
        val memo = mutableMapOf<Int, Int>()
        fun solve(remainingMask: Int): Int {
            if (remainingMask == 0) return 0
            memo[remainingMask]?.let { return it }
            
            val firstElement = Integer.numberOfTrailingZeros(remainingMask and -remainingMask)
            var res = Int.MAX_VALUE
            
            for ((mask, cost) in validSubsets) {
                if ((mask and remainingMask) == mask && ((mask shr firstElement) and 1) == 1) {
                    val next = solve(remainingMask xor mask)
                    if (next != Int.MAX_VALUE) {
                        res = minOf(res, cost + next)
                    }
                }
            }
            
            memo[remainingMask] = res
            return res
        }
        
        val ans = solve((1 shl n) - 1)
        return if (ans == Int.MAX_VALUE) -1 else ans
    }
}
