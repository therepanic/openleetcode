class Solution {
    func matrixScore(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        for i in 0..<rows {
            if grid[i][0] == 0 {
                for j in 0..<cols {
                    grid[i][j] ^= 1
                }
            }
        }
        for j in 1..<cols {
            var temp = 0
            for i in 0..<rows {
                temp += grid[i][j]
            }
            if 2 * temp < rows {
                for i in 0..<rows {
                    grid[i][j] ^= 1
                }
            }
        }
        var ans = 0
        for row in grid {
            var val = 0
            for bit in row {
                val = (val << 1) | bit
            }
            ans += val
        }
        return ans
    }
}
