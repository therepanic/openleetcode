class Solution {
    fun maximumPopulation(logs: Array<IntArray>): Int {
        val l = logs.size
        val a = IntArray(l)
        var r = 0
        var y = 0
        for (i in 0 until l) {
            a[i] = logs[i][0]
        }
        for (j in 0 until l) {
            var c = 0
            for (k in 0 until l) {
                if (a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k) {
                    c++
                }
            }
            if (c > r) {
                r = c
                y = a[j]
            }
            if (c == r && r > 0) {
                if (a[j] < y) {
                    y = a[j]
                }
            }
        }
        if (y == 0) {
            var min = a[0]
            for (i in 1 until l) {
                if (a[i] < min) min = a[i]
            }
            return min
        }
        return y
    }
}
