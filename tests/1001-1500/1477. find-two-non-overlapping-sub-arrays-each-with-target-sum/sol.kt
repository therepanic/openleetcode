class Solution {
    fun minSumOfLengths(arr: IntArray, target: Int): Int {
        val n = arr.size
        val bestLeft = IntArray(n) { n }
        var minTotal = Int.MAX_VALUE
        var left = 0
        var curr = 0
        for (right in arr.indices) {
            curr += arr[right]
            while (curr > target) {
                curr -= arr[left]
                left++
            }
            if (curr == target) {
                val length = right - left + 1
                if (right > 0) {
                    bestLeft[right] = minOf(bestLeft[right - 1], length)
                } else {
                    bestLeft[right] = length
                }
                if (left > 0 && bestLeft[left - 1] != n) {
                    minTotal = minOf(minTotal, bestLeft[left - 1] + length)
                }
            } else {
                if (right > 0) {
                    bestLeft[right] = bestLeft[right - 1]
                }
            }
        }
        return if (minTotal == Int.MAX_VALUE) -1 else minTotal
    }
}
