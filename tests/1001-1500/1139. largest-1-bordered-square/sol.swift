class Solution {
    func largest1BorderedSquare(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var h = Array(repeating: Array(repeating: 0, count: n), count: m)
        var v = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    h[i][j] = (j == 0 ? 0 : h[i][j-1]) + 1
                    v[i][j] = (i == 0 ? 0 : v[i-1][j]) + 1
                }
            }
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                let sz = min(h[i][j], v[i][j])
                if sz > 0 {
                    for k in stride(from: sz, through: 1, by: -1) {
                        if h[i-k+1][j] >= k && v[i][j-k+1] >= k {
                            ans = max(ans, k)
                            break
                        }
                    }
                }
            }
        }
        return ans * ans
    }
}
