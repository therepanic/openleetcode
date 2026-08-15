class Solution {
    fun getMaximumGenerated(n: Int): Int {
        if (n == 0) {
            return 0
        } else if (n == 1 || n == 2) {
            return 1
        } else {
            val a = IntArray(n + 1)
            a[0] = 0
            a[1] = 1
            var v = 1
            for (i in 2..n) {
                if (i % 2 == 0) {
                    a[i] = a[v]
                } else {
                    a[i] = a[v] + a[v + 1]
                    v++
                }
            }
            return a.max()!!
        }
    }
}
