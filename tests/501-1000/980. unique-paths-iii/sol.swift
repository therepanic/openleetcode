class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var grid = grid
        var sx = -1, sy = -1
        var count = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    count += 1
                }
                if grid[i][j] == 1 {
                    sx = i
                    sy = j
                }
            }
        }
        return backtrack(&grid, m, n, sx, sy, count)
    }
    
    private func backtrack(_ grid: inout [[Int]], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ count: Int) -> Int {
        var result = 0
        let dirs = [[i-1, j], [i+1, j], [i, j-1], [i, j+1]]
        for d in dirs {
            let x = d[0], y = d[1]
            if x < 0 || x >= m || y < 0 || y >= n {
                continue
            }
            if grid[x][y] == 2 {
                if count == 0 {
                    result += 1
                }
            } else if grid[x][y] == 0 {
                grid[x][y] = -1
                result += backtrack(&grid, m, n, x, y, count - 1)
                grid[x][y] = 0
            }
        }
        return result
    }
}
