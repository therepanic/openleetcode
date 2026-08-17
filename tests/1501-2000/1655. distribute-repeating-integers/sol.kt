class Solution {
    fun canDistribute(nums: IntArray, quantity: IntArray): Boolean {
        quantity.sortDescending()
        val freqCounts = mutableMapOf<Int, Int>()
        val freqMap = mutableMapOf<Int, Int>()
        for (n in nums) freqMap[n] = freqMap.getOrDefault(n, 0) + 1
        for (f in freqMap.values) freqCounts[f] = freqCounts.getOrDefault(f, 0) + 1
        
        fun backtrack(i: Int): Boolean {
            if (i == quantity.size) return true
            for ((freq, count) in freqCounts.toList()) {
                if (freq >= quantity[i] && count > 0) {
                    freqCounts[freq] = count - 1
                    val newFreq = freq - quantity[i]
                    freqCounts[newFreq] = freqCounts.getOrDefault(newFreq, 0) + 1
                    if (backtrack(i + 1)) return true
                    freqCounts[freq] = count
                    val newCount = freqCounts[newFreq]!!
                    if (newCount == 1) freqCounts.remove(newFreq)
                    else freqCounts[newFreq] = newCount - 1
                }
            }
            return false
        }
        
        return backtrack(0)
    }
}
