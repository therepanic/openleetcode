class Solution {
    fun canVisitAllRooms(rooms: List<List<Int>>): Boolean {
        val n = rooms.size
        if (n == 0) return true
        val keys = ArrayDeque<Int>()
        val visited = BooleanArray(n)
        keys.addLast(0)
        visited[0] = true
        var count = 1
        while (keys.isNotEmpty()) {
            val room = keys.removeLast()
            for (i in rooms[room]) {
                if (!visited[i]) {
                    visited[i] = true
                    keys.addLast(i)
                    count++
                }
            }
        }
        return count == n
    }

    fun canVisitAllRooms(rooms: Array<IntArray>): Boolean {
        return canVisitAllRooms(rooms.map { it.toList() })
    }
}
