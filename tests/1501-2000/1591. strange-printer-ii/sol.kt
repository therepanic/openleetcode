class Solution {
    fun isPrintable(targetGrid: Array<IntArray>): Boolean {
        val m = targetGrid.size 
        val n = targetGrid[0].size
        val colors = mutableMapOf<Int, MutableList<Pair<Int, Int>>>()
        for (i in 0 until m) {
            for (j in 0 until n) {
                colors.getOrPut(targetGrid[i][j]) { mutableListOf() }.add(i to j)
            }
        }
        
        fun canRemove(color: Int): Boolean {
            val pos = colors[color]!!
            var mnR = pos.minOf { it.first }
            var mxR = pos.maxOf { it.first }
            var mnC = pos.minOf { it.second }
            var mxC = pos.maxOf { it.second }
            for (i in mnR..mxR) {
                for (j in mnC..mxC) {
                    if (targetGrid[i][j] != color && targetGrid[i][j] > 0) return false
                }
            }
            for (i in mnR..mxR) {
                for (j in mnC..mxC) {
                    targetGrid[i][j] = 0
                }
            }
            return true
        }
        
        val colorSet = colors.keys.toMutableSet()
        while (colorSet.isNotEmpty()) {
            val removable = colorSet.filter { canRemove(it) }.toSet()
            if (removable.isEmpty()) return false
            colorSet.removeAll(removable)
        }
        return true
    }
}
