class Solution {
    fun topKFrequent(words: Array<String>, k: Int): List<String> {
        val counter = mutableMapOf<String, Int>()
        for (w in words) counter[w] = counter.getOrDefault(w, 0) + 1
        val heap = java.util.PriorityQueue<Pair<Int, String>>(compareBy({ it.first }, { it.second }))
        for ((w, f) in counter) heap.offer(Pair(-f, w))
        val ans = mutableListOf<String>()
        repeat(k) { ans.add(heap.poll().second) }
        return ans
    }
}
