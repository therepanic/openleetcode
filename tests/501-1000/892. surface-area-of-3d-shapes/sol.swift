class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var area = 0
        for i in 0..<n {
            for j in 0..<n {
                if grid[i][j] > 0 {
                    area += grid[i][j] * 6
                    area -= (grid[i][j] - 1) * 2
                    if i + 1 < n {
                        area -= 2 * min(grid[i][j], grid[i + 1][j])
                    }
                    if j + 1 < n {
                        area -= 2 * min(grid[i][j], grid[i][j + 1])
                    }
                }
            }
        }
        return area
    }
}
