class Solution {
    fun minMutation(startGene: String, endGene: String, bank: Array<String>): Int {
        val s = bank.toHashSet()
        if (!s.contains(endGene) && startGene != endGene) return -1
        val q: Queue<Pair<String, Int>> = LinkedList()
        val v = HashSet<String>()
        q.add(Pair(startGene, 0))
        v.add(startGene)
        val choices = charArrayOf('A', 'C', 'G', 'T')
        while (q.isNotEmpty()) {
            val (g, d) = q.poll()
            if (g == endGene) return d
            for (i in 0 until 8) {
                for (c in choices) {
                    if (g[i] != c) {
                        val n = g.substring(0, i) + c + g.substring(i+1)
                        if (s.contains(n) && !v.contains(n)) {
                            v.add(n)
                            q.add(Pair(n, d+1))
                        }
                    }
                }
            }
        }
        return -1
    }
}
