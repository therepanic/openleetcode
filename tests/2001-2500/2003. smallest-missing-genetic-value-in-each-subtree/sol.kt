class Solution {
    private lateinit var seen: BooleanArray
    private lateinit var nums: IntArray
    private lateinit var graph: Array<MutableList<Int>>
    
    fun smallestMissingValueSubtree(parents: IntArray, nums: IntArray): IntArray {
        val n = parents.size
        this.nums = nums
        graph = Array(n) { mutableListOf() }
        
        var nodeOne = -1
        var root = -1
        for (child in 0 until n) {
            if (parents[child] == -1) {
                root = child
            } else {
                graph[parents[child]].add(child)
            }
            if (nums[child] == 1) nodeOne = child
        }
        
        val results = IntArray(n) { 1 }
        if (nodeOne == -1) return results
        
        seen = BooleanArray(100002)
        var current = nodeOne
        var missing = 1
        
        while (current != -1) {
            markSeen(current)
            while (missing < 100002 && seen[missing]) missing++
            results[current] = missing
            current = parents[current]
        }
        
        return results
    }
    
    private fun markSeen(node: Int) {
        if (!seen[nums[node]]) {
            seen[nums[node]] = true
            for (child in graph[node]) markSeen(child)
        }
    }
}
