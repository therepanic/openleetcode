class Solution {
    fun catMouseGame(graph: Array<IntArray>): Int {
        val MOUSE = 0
        val CAT = 1
        val MOUSE_WIN = 1
        val CAT_WIN = 2
        val DRAW = 0
        
        val n = graph.size
        val results = HashMap<String, Int>()
        for (i in 1 until n) {
            results["0,$i,$CAT"] = MOUSE_WIN
            results["0,$i,$MOUSE"] = MOUSE_WIN
            results["$i,$i,$CAT"] = CAT_WIN
            results["$i,$i,$MOUSE"] = CAT_WIN
        }
        
        val degree = HashMap<String, Int>()
        for (mouse in 1 until n) {
            for (cat in 1 until n) {
                degree["$mouse,$cat,$MOUSE"] = graph[mouse].size
                degree["$mouse,$cat,$CAT"] = graph[cat].count { it != 0 }
            }
        }
        
        val q: java.util.Queue<String> = java.util.LinkedList(results.keys)
        
        while (q.isNotEmpty()) {
            val state = q.poll()
            val parts = state.split(",")
            val mouse = parts[0].toInt()
            val cat = parts[1].toInt()
            val turn = parts[2].toInt()
            val curResult = results[state]!!
            
            val prevStates = mutableListOf<String>()
            if (turn == MOUSE) {
                for (prevCat in graph[cat]) {
                    prevStates.add("$mouse,$prevCat,$CAT")
                }
            } else {
                for (prevMouse in graph[mouse]) {
                    prevStates.add("$prevMouse,$cat,$MOUSE")
                }
            }
            
            for (prevState in prevStates) {
                if (results.containsKey(prevState)) continue
                val prevParts = prevState.split(",")
                val prevMouse = prevParts[0].toInt()
                val prevCat = prevParts[1].toInt()
                val prevTurn = prevParts[2].toInt()
                if (prevCat == 0) continue
                
                degree[prevState] = degree[prevState]!! - 1
                val isMoverWinner = ((curResult == MOUSE_WIN && prevTurn == MOUSE) ||
                                     (curResult == CAT_WIN && prevTurn == CAT))
                if (isMoverWinner || degree[prevState] == 0) {
                    results[prevState] = curResult
                    q.offer(prevState)
                }
            }
        }
        
        return results.getOrDefault("1,2,$MOUSE", DRAW)
    }
}
