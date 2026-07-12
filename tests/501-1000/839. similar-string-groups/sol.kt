class Solution {
    private fun checkSimilarity(str1: String, str2: String): Boolean {
        var diff = 0
        for (i in str1.indices) {
            if (str1[i] != str2[i]) {
                diff++
            }
        }
        return diff == 0 || diff == 2
    }
    
    private fun dfs(node: Int, matrix: List<MutableList<Int>>, visited: BooleanArray) {
        if (visited[node]) {
            return
        }
        visited[node] = true
        for (nei in matrix[node]) {
            if (!visited[nei]) {
                dfs(nei, matrix, visited)
            }
        }
    }
    
    fun numSimilarGroups(strs: Array<String>): Int {
        val n = strs.size
        val matrix = List(n) { mutableListOf<Int>() }
        
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (checkSimilarity(strs[i], strs[j])) {
                    matrix[i].add(j)
                    matrix[j].add(i)
                }
            }
        }
        
        var count = 0
        val visited = BooleanArray(n)
        for (start in 0 until n) {
            if (!visited[start]) {
                dfs(start, matrix, visited)
                count++
            }
        }
        
        return count
    }
}
