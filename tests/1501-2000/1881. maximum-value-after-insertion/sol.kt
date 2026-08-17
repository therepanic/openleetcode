class Solution {
    fun maxValue(n: String, x: Int): String {
        val xs = x.toString()
        return if (n[0] != '-') {
            for (i in n.indices) {
                if (xs[0] > n[i]) {
                    return n.substring(0, i) + xs + n.substring(i)
                }
            }
            n + xs
        } else {
            for (i in 1 until n.length) {
                if (xs[0] < n[i]) {
                    return n.substring(0, i) + xs + n.substring(i)
                }
            }
            n + xs
        }
    }
}
