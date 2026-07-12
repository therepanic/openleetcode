class Solution {
    func projectionArea(_ grid: [[Int]]) -> Int {
        var xyArea = 0
        var yzArea = 0
        var zxArea = 0
        let rows = grid.count
        let cols = grid[0].count
        for i in 0..<rows {
            var maxRow = 0
            for j in 0..<cols {
                if grid[i][j] > 0 { xyArea += 1 }
                if grid[i][j] > maxRow { maxRow = grid[i][j] }
            }
            yzArea += maxRow
        }
        for j in 0..<cols {
            var maxCol = 0
            for i in 0..<rows {
                if grid[i][j] > maxCol { maxCol = grid[i][j] }
            }
            zxArea += maxCol
        }
        return xyArea + yzArea + zxArea
    }
}
