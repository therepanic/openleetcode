class Solution {
    fun maxChunksToSorted(arr: IntArray): Int {
        val n = arr.size
        val minRight = IntArray(n)
        var currentMin = Int.MAX_VALUE
        for (i in n - 1 downTo 0) {
            if (arr[i] < currentMin) {
                currentMin = arr[i]
            }
            minRight[i] = currentMin
        }
        
        var chunks = 0
        var currentMax = Int.MIN_VALUE
        for (i in 0 until n - 1) {
            if (arr[i] > currentMax) {
                currentMax = arr[i]
            }
            if (currentMax <= minRight[i + 1]) {
                chunks++
            }
        }
        return chunks + 1
    }
}
