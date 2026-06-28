class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let m = img.count
        let n = img[0].count
        var P = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1]
            }
        }
        var res = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                let a = max(0, i - 1)
                let b = max(0, j - 1)
                let c = min(m - 1, i + 1)
                let d = min(n - 1, j + 1)
                let s = P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b]
                res[i][j] = s / ((c - a + 1) * (d - b + 1))
            }
        }
        return res
    }
}
