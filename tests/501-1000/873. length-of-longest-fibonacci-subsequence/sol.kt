class Solution {
    fun lenLongestFibSubseq(arr: IntArray): Int {
        val n = arr.size
        val dp = Array(n) { IntArray(n) }
        var maxLen = 0
        
        for (curr in 2 until n) {
            var start = 0
            var end = curr - 1
            
            while (start < end) {
                val pairSum = arr[start] + arr[end]
                
                when {
                    pairSum > arr[curr] -> end--
                    pairSum < arr[curr] -> start++
                    else -> {
                        dp[end][curr] = dp[start][end] + 1
                        maxLen = maxOf(dp[end][curr], maxLen)
                        end--
                        start++
                    }
                }
            }
        }
        
        return if (maxLen > 0) maxLen + 2 else 0
    }
}
