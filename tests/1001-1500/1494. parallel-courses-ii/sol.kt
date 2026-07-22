class Solution {
    private var n: Int = 0
    private var k: Int = 0
    private lateinit var graph: Array<MutableList<Int>>
    private val memo = HashMap<String, Int>()

    fun minNumberOfSemesters(n: Int, relations: Array<IntArray>, k: Int): Int {
        this.n = n
        this.k = k
        graph = Array(n) { mutableListOf<Int>() }
        val inDegrees = IntArray(n)
        for (rel in relations) {
            val prev = rel[0] - 1
            val next = rel[1] - 1
            inDegrees[next]++
            graph[prev].add(next)
        }
        memo.clear()
        return recurse((1 shl n) - 1, inDegrees)
    }
    
    private fun recurse(mask: Int, inDegrees: IntArray): Int {
        if (mask == 0) return 0
        val key = "$mask-${inDegrees.joinToString()}"
        memo[key]?.let { return it }
        
        val nodes = mutableListOf<Int>()
        for (i in 0 until n) {
            if ((mask and (1 shl i)) != 0 && inDegrees[i] == 0) {
                nodes.add(i)
            }
        }
        var ans = Int.MAX_VALUE
        val combLimit = minOf(k, nodes.size)
        val combinations = getCombinations(nodes, combLimit)
        for (kNodes in combinations) {
            var newMask = mask
            val newInDeg = inDegrees.clone()
            for (node in kNodes) {
                newMask = newMask xor (1 shl node)
                for (child in graph[node]) {
                    newInDeg[child]--
                }
            }
            ans = minOf(ans, 1 + recurse(newMask, newInDeg))
        }
        memo[key] = ans
        return ans
    }
    
    private fun getCombinations(nodes: List<Int>, k: Int): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        combineHelper(nodes, 0, k, mutableListOf(), result)
        return result
    }
    
    private fun combineHelper(nodes: List<Int>, start: Int, k: Int, current: MutableList<Int>, result: MutableList<List<Int>>) {
        if (k == 0) {
            result.add(current.toList())
            return
        }
        for (i in start until nodes.size) {
            current.add(nodes[i])
            combineHelper(nodes, i + 1, k - 1, current, result)
            current.removeAt(current.size - 1)
        }
    }
}
