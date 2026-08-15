class Solution {
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        let r = isWater.count
        let c = isWater[0].count
        var height = [[Int]](repeating: [Int](repeating: 1_000_000_000, count: c), count: r)

        for i in 0..<r {
            for j in 0..<c {
                if isWater[i][j] == 1 {
                    height[i][j] = 0
                } else {
                    if i > 0 { height[i][j] = min(height[i][j], height[i - 1][j] + 1) }
                    if j > 0 { height[i][j] = min(height[i][j], height[i][j - 1] + 1) }
                }
            }
        }

        for i in stride(from: r - 1, through: 0, by: -1) {
            for j in stride(from: c - 1, through: 0, by: -1) {
                if i < r - 1 { height[i][j] = min(height[i][j], height[i + 1][j] + 1) }
                if j < c - 1 { height[i][j] = min(height[i][j], height[i][j + 1] + 1) }
            }
        }

        return height
    }
}
