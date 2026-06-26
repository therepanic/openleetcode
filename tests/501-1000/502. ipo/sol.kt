class Solution {
    fun findMaximizedCapital(k: Int, w: Int, profits: IntArray, capital: IntArray): Int {
        val n = profits.size
        val projects = Array(n) { intArrayOf(capital[it], profits[it]) }
        projects.sortBy { it[0] }
        val maxHeap = java.util.PriorityQueue<Int>(compareByDescending { it })
        var i = 0
        var curW = w
        repeat(k) {
            while (i < n && projects[i][0] <= curW) {
                maxHeap.add(projects[i][1])
                i++
            }
            if (maxHeap.isEmpty()) return curW
            curW += maxHeap.poll()
        }
        return curW
    }
}
