class Solution {
    fun buildArray(target: IntArray, n: Int): List<String> {
        val res = mutableListOf<String>()
        val s = mutableListOf<Int>()
        var a = 0
        for (i in 1..n) {
            if (s == target.toList()) return res
            s.add(i)
            res.add("Push")
            if (s[a] != target[a]) {
                s.removeAt(s.size - 1)
                res.add("Pop")
            } else {
                a++
            }
        }
        return res
    }
}
