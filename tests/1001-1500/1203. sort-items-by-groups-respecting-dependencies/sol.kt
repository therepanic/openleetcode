class Solution {
    fun sortItems(n: Int, m: Int, group: IntArray, beforeItems: Array<IntArray>): IntArray {
        val groupToItems = mutableMapOf<Int, MutableSet<Int>>()
        var newGroup = m
        for (i in 0 until n) {
            if (group[i] == -1) group[i] = newGroup++
            groupToItems.getOrPut(group[i]) { mutableSetOf() }.add(i)
        }
        val intraPred = mutableMapOf<Int, MutableSet<Int>>()
        val intraSucc = mutableMapOf<Int, MutableSet<Int>>()
        val interPred = mutableMapOf<Int, MutableSet<Int>>()
        val interSucc = mutableMapOf<Int, MutableSet<Int>>()
        
        for (i in 0 until n) {
            for (before in beforeItems[i]) {
                if (group[i] == group[before]) {
                    intraPred.getOrPut(i) { mutableSetOf() }.add(before)
                    intraSucc.getOrPut(before) { mutableSetOf() }.add(i)
                } else {
                    interPred.getOrPut(group[i]) { mutableSetOf() }.add(group[before])
                    interSucc.getOrPut(group[before]) { mutableSetOf() }.add(group[i])
                }
            }
        }
        
        fun topoSort(nodes: Set<Int>, pred: MutableMap<Int, MutableSet<Int>>, succ: MutableMap<Int, MutableSet<Int>>): List<Int> {
            val order = mutableListOf<Int>()
            val queue = ArrayDeque<Int>()
            for (node in nodes) if (pred[node].isNullOrEmpty()) queue.addLast(node)
            while (queue.isNotEmpty()) {
                val node = queue.removeFirst()
                order.add(node)
                for (s in succ[node].orEmpty()) {
                    pred[s]?.remove(node)
                    if (pred[s].isNullOrEmpty()) queue.addLast(s)
                }
            }
            return if (order.size == nodes.size) order else emptyList()
        }
        
        val groupsOrder = topoSort(groupToItems.keys, interPred, interSucc)
        if (groupsOrder.isEmpty()) return intArrayOf()
        
        val result = mutableListOf<Int>()
        for (grp in groupsOrder) {
            val order = topoSort(groupToItems[grp]!!, intraPred, intraSucc)
            if (order.isEmpty()) return intArrayOf()
            result.addAll(order)
        }
        return result.toIntArray()
    }
}
