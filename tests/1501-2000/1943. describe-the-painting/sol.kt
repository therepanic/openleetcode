class Solution {
    fun splitPainting(segments: Array<IntArray>): List<List<Long>> {
        val events = mutableListOf<Pair<Int, Int>>()
        for (seg in segments) {
            events.add(Pair(seg[0], seg[2]))
            events.add(Pair(seg[1], -seg[2]))
        }
        events.sortBy { it.first }
        
        val ans = mutableListOf<List<Long>>()
        var prev = -1
        var mix = 0L
        for ((pos, amount) in events) {
            if (prev != -1) {
                if (pos != prev && mix != 0L) {
                    ans.add(listOf(prev.toLong(), pos.toLong(), mix))
                }
            }
            prev = pos
            mix += amount
        }
        return ans
    }
}
