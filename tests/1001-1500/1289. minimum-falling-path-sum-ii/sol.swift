class Solution {
    func minFallingPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var dp = grid[0]
        for i in 1..<n {
            var smallest = Int.max
            var secondSmallest = Int.max
            var smallestCol = -1
            for (col, value) in dp.enumerated() {
                if value < smallest {
                    secondSmallest = smallest
                    smallest = value
                    smallestCol = col
                } else if value < secondSmallest {
                    secondSmallest = value
                }
            }
            dp = (0..<n).map { col in
                grid[i][col] + (col == smallestCol ? secondSmallest : smallest)
            }
        }
        return dp.min()!
    }
}
