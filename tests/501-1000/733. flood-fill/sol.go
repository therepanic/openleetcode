func floodFill(image [][]int, sr int, sc int, color int) [][]int {
    old := image[sr][sc]
    if old == color {
        return image
    }
    m := len(image)
    n := len(image[0])
    var dfs func(int, int)
    dfs = func(i, j int) {
        if i < 0 || i >= m || j < 0 || j >= n || image[i][j] != old {
            return
        }
        image[i][j] = color
        dfs(i+1, j)
        dfs(i-1, j)
        dfs(i, j+1)
        dfs(i, j-1)
    }
    dfs(sr, sc)
    return image
}
