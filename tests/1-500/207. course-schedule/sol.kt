class Solution {
    fun canFinish(numCourses: Int, prerequisites: Array<IntArray>): Boolean {
        val graph = Array(numCourses) { ArrayList<Int>() }
        val indegree = IntArray(numCourses)
        for (edge in prerequisites) {
            graph[edge[1]].add(edge[0])
            indegree[edge[0]]++
        }
        val queue: java.util.ArrayDeque<Int> = java.util.ArrayDeque()
        for (i in 0 until numCourses) if (indegree[i] == 0) queue.add(i)
        var seen = 0
        while (!queue.isEmpty()) {
            val node = queue.removeFirst()
            seen++
            for (nxt in graph[node]) {
                indegree[nxt]--
                if (indegree[nxt] == 0) queue.add(nxt)
            }
        }
        return seen == numCourses
    }
}
