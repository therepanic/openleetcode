class Solution {

    fun rotateGrid(grid: Array<IntArray>, k: Int): Array<IntArray> {

        var t = 0

        var l = 0

        var b = grid.size - 1

        var r = grid[0].size - 1

        while (t < b && l < r) {

            val ln = b - t

            val wid = r - l

            val perimeter = 2 * ln + 2 * wid

            var steps = k % perimeter

            while (steps-- > 0) {

                val tmp = grid[t][l]

                for (i in l until r) grid[t][i] = grid[t][i + 1]

                for (i in t until b) grid[i][r] = grid[i + 1][r]

                for (i in r downTo l + 1) grid[b][i] = grid[b][i - 1]

                for (i in b downTo t + 1) grid[i][l] = grid[i - 1][l]

                grid[t + 1][l] = tmp

            }

            t++; l++; b--; r--

        }

        return grid

    }

}
