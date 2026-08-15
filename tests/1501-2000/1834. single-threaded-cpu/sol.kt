class Solution {
    fun getOrder(tasks: Array<IntArray>): IntArray {
        val n = tasks.size
        val indexed = Array(n) { IntArray(3) }
        for (i in 0 until n) {
            indexed[i][0] = tasks[i][0]
            indexed[i][1] = tasks[i][1]
            indexed[i][2] = i
        }
        indexed.sortBy { it[0] }
        
        val result = IntArray(n)
        val heap = PriorityQueue<IntArray> { a, b ->
            if (a[1] != b[1]) a[1] - b[1] else a[2] - b[2]
        }
        
        var time = 0L
        var idx = 0
        var resIdx = 0
        
        while (idx < n || heap.isNotEmpty()) {
            if (heap.isEmpty() && time < indexed[idx][0]) {
                time = indexed[idx][0].toLong()
            }
            
            while (idx < n && indexed[idx][0] <= time) {
                heap.offer(indexed[idx])
                idx++
            }
            
            val task = heap.poll()
            result[resIdx++] = task[2]
            time += task[1].toLong()
        }
        
        return result
    }
}
