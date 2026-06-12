class Solution {
    fun compareVersion(version1: String, version2: String): Int {
        val a = version1.split(".")
        val b = version2.split(".")
        val n = maxOf(a.size, b.size)
        for (i in 0 until n) {
            val x = if (i < a.size) a[i].toInt() else 0
            val y = if (i < b.size) b[i].toInt() else 0
            if (x < y) return -1
            if (x > y) return 1
        }
        return 0
    }
}
