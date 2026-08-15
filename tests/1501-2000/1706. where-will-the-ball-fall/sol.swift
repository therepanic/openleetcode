class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let m = grid.count, n = grid[0].count
        var result = [Int](repeating: 0, count: n)
        for col in 0..<n {
            var cur = col
            for row in 0..<m {
                let d = grid[row][cur]
                let nxt = cur + d
                if nxt < 0 || nxt >= n || grid[row][nxt] != d {
                    cur = -1
                    break
                }
                cur = nxt
            }
            result[col] = cur
        }
        return result
    }
}
