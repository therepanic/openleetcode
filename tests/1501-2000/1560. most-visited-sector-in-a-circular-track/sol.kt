class Solution {
    fun mostVisited(n: Int, rounds: IntArray): List<Int> {
        val s = rounds[0]
        val e = rounds[rounds.size - 1]
        return if (s <= e) (s..e).toList() else (1..e).toList() + (s..n).toList()
    }
}
