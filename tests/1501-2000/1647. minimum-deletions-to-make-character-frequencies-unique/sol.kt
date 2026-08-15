class Solution {
    fun minDeletions(s: String): Int {
        val count = IntArray(26)
        for (c in s) count[c - 'a']++
        val freqs = count.filter { it > 0 }.sortedDescending().toMutableList()
        var deletes = 0
        for (idx in 1 until freqs.size) {
            if (freqs[idx] >= freqs[idx - 1]) {
                val target = maxOf(0, freqs[idx - 1] - 1)
                deletes += (freqs[idx] - target)
                freqs[idx] = target
            }
        }
        return deletes
    }
}
