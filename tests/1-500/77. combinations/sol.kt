class Solution {
    fun combine(n: Int, k: Int): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        val current = mutableListOf<Int>()
        dfs(1, n, k, current, result)
        return result
    }

    private fun dfs(start: Int, n: Int, k: Int, current: MutableList<Int>, result: MutableList<List<Int>>) {
        if (current.size == k) {
            result.add(current.toList())
            return
        }
        for (value in start..n) {
            current.add(value)
            dfs(value + 1, n, k, current, result)
            current.removeAt(current.lastIndex)
        }
    }
}
