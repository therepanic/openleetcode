class Solution {
    fun reconstructQueue(people: Array<IntArray>): Array<IntArray> {
        people.sortWith(compareByDescending<IntArray> { it[0] }.thenBy { it[1] })
        val q = mutableListOf<IntArray>()
        for (p in people) {
            q.add(p[1], p)
        }
        return q.toTypedArray()
    }
}
