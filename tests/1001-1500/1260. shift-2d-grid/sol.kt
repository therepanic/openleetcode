class Solution {
    fun shiftGrid(grid: Array<IntArray>, k: Int): List<List<Int>> {
        val m = grid.size
        val n = grid[0].size
        val total = m * n
        var k = k % total
        if (k == 0) {
            return grid.map { it.toList() }
        }
        
        val lastKElements = IntArray(k)
        var i = m - 1
        var x = n - 1
        var count = 0
        
        while (count != k) {
            lastKElements[count] = grid[i][x]
            if (x >= 1) x--
            else {
                i--
                x = n - 1
            }
            count++
        }
        
        var j = m - 1
        var y = n - 1
        
        while (i != 0 || x != -1) {
            if (x == -1) {
                i--
                x = n - 1
            }
            if (y == -1) {
                j--
                y = n - 1
            }
            grid[j][y] = grid[i][x]
            x--
            y--
        }
        
        var idx = 0
        while (k > 0) {
            if (y == -1) {
                j--
                y = n - 1
            }
            grid[j][y] = lastKElements[idx]
            y--
            k--
            idx++
        }
        
        return grid.map { it.toList() }
    }
}
