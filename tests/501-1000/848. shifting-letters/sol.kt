class Solution {
    fun shiftingLetters(s: String, shifts: IntArray): String {
        val n = shifts.size
        val l = IntArray(n)
        var z = 0
        for (i in n - 1 downTo 0) {
            z = (z + shifts[i]) % 26
            l[i] = z
        }
        val p = s.map { it.code - 97 }
        val k = StringBuilder()
        for (i in 0 until n) {
            k.append(((p[i] + l[i]) % 26 + 97).toChar())
        }
        return k.toString()
    }
}
