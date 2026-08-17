class Solution {
    fun findLatestStep(arr: IntArray, m: Int): Int {
        val n = arr.size
        if (m == n) return m
        
        val groups = IntArray(n + 2)
        var latestStep = -1
        
        for (i in 0 until n) {
            val idx = arr[i]
            val left = groups[idx - 1]
            val right = groups[idx + 1]
            
            if (left == m || right == m) latestStep = i
            
            val size = left + right + 1
            groups[idx - left] = size
            groups[idx + right] = size
        }
        
        return latestStep
    }
}
