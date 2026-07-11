class Solution {
    fun sumSubarrayMins(arr: IntArray): Int {
        val MOD = 1_000_000_007
        val n = arr.size
        val stack = IntArray(n)
        var top = -1
        val res = LongArray(n)
        for (i in 0 until n) {
            while (top >= 0 && arr[stack[top]] > arr[i]) {
                top--
            }
            val j = if (top >= 0) stack[top] else -1
            res[i] = (if (j >= 0) res[j] else 0L) + (i - j).toLong() * arr[i]
            stack[++top] = i
        }
        var sum = 0L
        for (v in res) {
            sum = (sum + v) % MOD
        }
        return sum.toInt()
    }
}
