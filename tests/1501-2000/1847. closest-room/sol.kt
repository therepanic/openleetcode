class Solution {
    fun closestRoom(rooms: Array<IntArray>, queries: Array<IntArray>): IntArray {
        val sortedRooms = rooms.sortedByDescending { it[1] }
        val indexed = queries.indices.sortedByDescending { queries[it][1] }

        val active = sortedSetOf<Int>()
        val result = IntArray(queries.size) { -1 }
        var roomIdx = 0

        for (qi in indexed) {
            val preferred = queries[qi][0]
            val minimum = queries[qi][1]

            while (roomIdx < sortedRooms.size && sortedRooms[roomIdx][1] >= minimum) {
                active.add(sortedRooms[roomIdx][0])
                roomIdx++
            }

            val pos = active.ceiling(preferred)
            val prev = active.floor(preferred)
            val candidates = mutableListOf<Int>()
            if (pos != null) candidates.add(pos)
            if (prev != null) candidates.add(prev)

            if (candidates.isNotEmpty()) {
                result[qi] = candidates.minWith(compareBy({ Math.abs(it - preferred) }, { it }))
            }
        }
        return result
    }
}
