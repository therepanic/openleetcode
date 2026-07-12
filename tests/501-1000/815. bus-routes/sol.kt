class Solution {
    fun numBusesToDestination(routes: Array<IntArray>, source: Int, target: Int): Int {
        if (source == target) return 0
        val adj = mutableMapOf<Int, MutableSet<Int>>()
        for (bus in routes.indices) {
            for (location in routes[bus]) {
                adj.getOrPut(location) { mutableSetOf() }.add(bus)
            }
        }
        val queue = ArrayDeque(adj[target] ?: emptySet())
        var cost = 0
        val visited = mutableSetOf<Int>()
        while (queue.isNotEmpty()) {
            cost++
            repeat(queue.size) {
                val node = queue.removeFirst()
                visited.add(node)
                if (source in routes[node]) return cost
                for (location in routes[node]) {
                    for (bus in adj[location] ?: emptySet()) {
                        if (bus !in visited) {
                            queue.add(bus)
                        }
                    }
                }
            }
        }
        return -1
    }
}
