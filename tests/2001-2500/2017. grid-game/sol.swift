class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        var minResult = Int.max
        var row1Sum = grid[0].reduce(0, +)
        var row2Sum = 0
        
        for i in 0..<grid[0].count {
            row1Sum -= grid[0][i]
            let currentMax = max(row1Sum, row2Sum)
            minResult = min(minResult, currentMax)
            row2Sum += grid[1][i]
        }
        
        return minResult
    }
}
