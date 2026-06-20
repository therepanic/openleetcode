class Solution {
    fun findMinHeightTrees(n: Int, edges: Array<IntArray>): List<Int> {
        if (n < 3) {
            return (0 until n).toList()
        }

        val adjacencyList = Array(n) { mutableSetOf<Int>() }
        for ((a, b) in edges) {
            adjacencyList[a].add(b)
            adjacencyList[b].add(a)
        }

        var leaves = (0 until n).filter { adjacencyList[it].size == 1 }.toMutableList()
        var remainingNodes = n

        while (remainingNodes > 2) {
            remainingNodes -= leaves.size
            val newLeaves = mutableListOf<Int>()
            for (leaf in leaves) {
                val neighbor = adjacencyList[leaf].first()
                adjacencyList[neighbor].remove(leaf)
                if (adjacencyList[neighbor].size == 1) {
                    newLeaves.add(neighbor)
                }
            }
            leaves = newLeaves
        }

        return leaves
    }
}
