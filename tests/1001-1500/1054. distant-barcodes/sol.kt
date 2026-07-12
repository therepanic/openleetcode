class Solution {
    fun rearrangeBarcodes(barcodes: IntArray): IntArray {
        val h = mutableMapOf<Int, Int>()
        for (i in barcodes) {
            h[i] = h.getOrDefault(i, 0) + 1
        }
        val heap = PriorityQueue<IntArray>(compareBy { it[0] })
        for ((k, v) in h) {
            heap.offer(intArrayOf(-v, k))
        }
        val l = mutableListOf<Int>()
        while (heap.size > 1) {
            val x = heap.poll()
            val y = heap.poll()
            l.add(x[1])
            l.add(y[1])
            x[0]++
            y[0]++
            if (x[0] != 0) {
                heap.offer(x)
            }
            if (y[0] != 0) {
                heap.offer(y)
            }
        }
        if (heap.isNotEmpty()) {
            l.add(heap.poll()[1])
        }
        return l.toIntArray()
    }
}
