class Solution {
    fun countArrangement(n: Int): Int {
        val visited = BooleanArray(n + 1)
        return backtrack(1, n, visited)
    }
    
    private fun backtrack(index: Int, n: Int, visited: BooleanArray): Int {
        if (index > n) {
            return 1
        }
        var count = 0
        for (i in 1..n) {
            if (!visited[i] && (i % index == 0 || index % i == 0)) {
                visited[i] = true
                count += backtrack(index + 1, n, visited)
                visited[i] = false
            }
        }
        return count
    }
}
