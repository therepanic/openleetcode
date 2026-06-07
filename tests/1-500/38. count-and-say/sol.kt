class Solution {
    fun countAndSay(n: Int): String {
        var current = "1"
        for (step in 1 until n) {
            val next = StringBuilder()
            var i = 0
            while (i < current.length) {
                var j = i
                while (j < current.length && current[j] == current[i]) {
                    j++
                }
                next.append(j - i).append(current[i])
                i = j
            }
            current = next.toString()
        }
        return current
    }
}
