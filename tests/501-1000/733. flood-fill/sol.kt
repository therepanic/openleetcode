class Solution {
    fun floodFill(image: Array<IntArray>, sr: Int, sc: Int, color: Int): Array<IntArray> {
        val old = image[sr][sc]
        if (old == color) return image
        val m = image.size
        val n = image[0].size
        fun dfs(i: Int, j: Int) {
            if (i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old) return
            image[i][j] = color
            dfs(i + 1, j)
            dfs(i - 1, j)
            dfs(i, j + 1)
            dfs(i, j - 1)
        }
        dfs(sr, sc)
        return image
    }
}
