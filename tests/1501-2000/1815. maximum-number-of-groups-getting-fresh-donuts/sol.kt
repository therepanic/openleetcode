class Solution {
    fun maxHappyGroups(batchSize: Int, groups: IntArray): Int {
        val counts = IntArray(batchSize)
        var happyCount = 0
        for (g in groups) {
            val rem = g % batchSize
            if (rem == 0) {
                happyCount++
            } else {
                counts[rem]++
            }
        }
        
        for (i in 1..batchSize / 2) {
            if (i == batchSize - i) {
                val pairCount = counts[i] / 2
                happyCount += pairCount
                counts[i] %= 2
            } else {
                val pairCount = minOf(counts[i], counts[batchSize - i])
                happyCount += pairCount
                counts[i] -= pairCount
                counts[batchSize - i] -= pairCount
            }
        }
        
        val state = counts.copyOfRange(1, batchSize)
        val memo = HashMap<String, Int>()
        return happyCount + viterbi(state, 0, batchSize, memo)
    }
    
    private fun viterbi(counts: IntArray, leftover: Int, batchSize: Int, memo: HashMap<String, Int>): Int {
        val key = counts.joinToString(",") + "," + leftover
        memo[key]?.let { return it }
        
        if (counts.sum() == 0) {
            memo[key] = 0
            return 0
        }
        
        var res = 0
        for (i in counts.indices) {
            if (counts[i] > 0) {
                val rem = i + 1
                val next = counts.clone()
                next[i]--
                
                val isHappy = if (leftover == 0) 1 else 0
                val newLeftover = (leftover + rem) % batchSize
                
                res = maxOf(res, isHappy + viterbi(next, newLeftover, batchSize, memo))
            }
        }
        memo[key] = res
        return res
    }
}
