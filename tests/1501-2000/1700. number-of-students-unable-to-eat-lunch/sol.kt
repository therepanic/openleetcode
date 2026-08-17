class Solution {
    fun countStudents(students: IntArray, sandwiches: IntArray): Int {
        val s = students.toMutableList()
        val sw = sandwiches.toMutableList()
        var c = 0
        while (s.isNotEmpty()) {
            if (s[0] == sw[0]) {
                sw.removeAt(0)
                s.removeAt(0)
                c = 0
            } else {
                s.add(s.removeAt(0))
                c++
            }
            if (c == s.size) break
        }
        return s.size
    }
}
