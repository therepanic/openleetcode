class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var rowMax = [Int](repeating: 0, count: n)
        var colMax = [Int](repeating: 0, count: n)
        for r in 0..<n {
            rowMax[r] = grid[r].max()!
        }
        for c in 0..<n {
            var maxVal = 0
            for r in 0..<n {
                maxVal = max(maxVal, grid[r][c])
            }
            colMax[c] = maxVal
        }
        var gain = 0
        for r in 0..<n {
            for c in 0..<n {
                gain += min(rowMax[r], colMax[c]) - grid[r][c]
            }
        }
        return gain
    }
}
