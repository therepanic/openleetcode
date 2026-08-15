class Solution {
    fun rotateTheBox(boxGrid: Array<CharArray>): Array<CharArray> {
        val r = boxGrid.size
        val c = boxGrid[0].size
        val rotate = Array(c) { CharArray(r) { '.' } }
        for (i in 0 until r) {
            var bottom = c - 1
            for (j in c - 1 downTo 0) {
                when (boxGrid[i][j]) {
                    '#' -> {
                        rotate[bottom][r - 1 - i] = '#'
                        bottom--
                    }
                    '*' -> {
                        rotate[j][r - 1 - i] = '*'
                        bottom = j - 1
                    }
                }
            }
        }
        return rotate
    }
}
