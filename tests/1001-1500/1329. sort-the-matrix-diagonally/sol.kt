class Solution {
    fun diagonalSort(mat: Array<IntArray>): Array<IntArray> {
        val m = mat.size
        val n = mat[0].size
        val diagonals = mutableMapOf<Int, MutableList<Int>>()
        
        for (i in 0 until m) {
            for (j in 0 until n) {
                val key = i - j
                diagonals.getOrPut(key) { mutableListOf() }.add(mat[i][j])
            }
        }
        
        for (list in diagonals.values) {
            list.sortDescending()
        }
        
        for (i in 0 until m) {
            for (j in 0 until n) {
                val list = diagonals[i - j]!!
                mat[i][j] = list.removeAt(list.size - 1)
            }
        }
        
        return mat
    }
}
