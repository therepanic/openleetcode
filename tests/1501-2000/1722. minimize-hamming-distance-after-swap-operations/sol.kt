class Solution {
    fun minimumHammingDistance(source: IntArray, target: IntArray, allowedSwaps: Array<IntArray>): Int {
        val n = source.size
        val parent = IntArray(n) { it }
        
        fun find(x: Int): Int {
            if (parent[x] != x) {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        fun unite(a: Int, b: Int) {
            parent[find(a)] = find(b)
        }
        
        for (swap in allowedSwaps) {
            unite(swap[0], swap[1])
        }
        
        val groups = mutableMapOf<Int, MutableList<Int>>()
        for (i in 0 until n) {
            val root = find(i)
            groups.getOrPut(root) { mutableListOf() }.add(source[i])
        }
        val freqMap = groups.mapValues { (_, vals) -> vals.groupingBy { it }.eachCount().toMutableMap() }
        
        var hammingDist = 0
        for (i in 0 until n) {
            val root = find(i)
            val freq = freqMap.getValue(root)
            val value = target[i]
            if (freq.getOrDefault(value, 0) > 0) {
                freq[value] = freq[value]!! - 1
            } else {
                hammingDist++
            }
        }
        return hammingDist
    }
}
