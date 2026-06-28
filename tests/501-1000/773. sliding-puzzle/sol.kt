class Solution {
    fun slidingPuzzle(board: Array<IntArray>): Int {
        val target = "123450"
        val start = board.flatMap { it.toList() }.joinToString("")
        
        val neighbors = mapOf(
            0 to intArrayOf(1, 3),
            1 to intArrayOf(0, 2, 4),
            2 to intArrayOf(1, 5),
            3 to intArrayOf(0, 4),
            4 to intArrayOf(1, 3, 5),
            5 to intArrayOf(2, 4)
        )
        
        val queue: Queue<Pair<String, Int>> = LinkedList()
        val visited = mutableSetOf<String>()
        queue.add(Pair(start, 0))
        visited.add(start)
        
        while (queue.isNotEmpty()) {
            val (state, moves) = queue.poll()
            
            if (state == target) {
                return moves
            }
            
            val zeroIndex = state.indexOf('0')
            
            for (neighbor in neighbors[zeroIndex]!!) {
                val newState = state.toCharArray()
                val temp = newState[zeroIndex]
                newState[zeroIndex] = newState[neighbor]
                newState[neighbor] = temp
                val newStateStr = String(newState)
                
                if (newStateStr !in visited) {
                    visited.add(newStateStr)
                    queue.add(Pair(newStateStr, moves + 1))
                }
            }
        }
        
        return -1
    }
}
