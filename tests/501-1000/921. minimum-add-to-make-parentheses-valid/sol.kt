class Solution {
    fun minAddToMakeValid(s: String): Int {
        val l = ArrayDeque<Char>()
        l.addLast('0')
        for (i in s) {
            if (l.last() == '(' && i == ')') {
                l.removeLast()
            } else {
                l.addLast(i)
            }
        }
        return l.size - 1
    }
}
