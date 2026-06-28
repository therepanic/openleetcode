class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        let old = image[sr][sc]
        if old == color { return image }
        let m = image.count
        let n = image[0].count
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old { return }
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
