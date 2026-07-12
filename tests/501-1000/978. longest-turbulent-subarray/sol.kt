class Solution {
    fun maxTurbulenceSize(arr: IntArray): Int {
        val N = arr.size
        if (N < 2) return N

        var ans = 1
        var anchor = 0

        fun compare(x: Int, y: Int): Int {
            return when {
                x < y -> -1
                x > y -> 1
                else -> 0
            }
        }

        for (i in 1 until N) {
            val c = compare(arr[i - 1], arr[i])
            if (c == 0) {
                anchor = i
            } else {
                if (i == N - 1 || c * compare(arr[i], arr[i + 1]) != -1) {
                    ans = maxOf(ans, i - anchor + 1)
                    anchor = i
                }
            }
        }
        return ans
    }
}
