class Solution {
    fun trimMean(arr: IntArray): Double {
        val n = arr.size
        val per5 = (0.05 * n).toInt()
        arr.sort()
        var sum = 0.0
        for (i in per5 until n - per5) {
            sum += arr[i]
        }
        return sum / (n - per5 - per5)
    }
}
