import java.util.PriorityQueue

class Solution {
    fun isPossible(target: IntArray): Boolean {
        val heap = PriorityQueue<Long>(compareByDescending { it })
        var total = 0L
        for (v in target) {
            heap.offer(v.toLong())
            total += v
        }
        while (true) {
            val largest = heap.poll()
            val rest = total - largest
            if (largest == 1L || rest == 1L) {
                return true
            }
            if (rest == 0L || rest >= largest) {
                return false
            }
            val previous = largest % rest
            if (previous == 0L) {
                return false
            }
            total = rest + previous
            heap.offer(previous)
        }
    }
}
