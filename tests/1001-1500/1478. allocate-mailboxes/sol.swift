class Solution {
    func minDistance(_ houses: [Int], _ k: Int) -> Int {
        let n = houses.count
        var houses = houses.sorted()
        var P = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            P[i + 1] = P[i] + houses[i]
        }
        
        var G = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in i..<n {
                let mid = (i + j) / 2
                let countLeft = mid - i + 1
                let countRight = j - mid
                let sumLeft = P[mid + 1] - P[i]
                let sumRight = P[j + 1] - P[mid + 1]
                G[i][j] = (houses[mid] * countLeft - sumLeft) + (sumRight - houses[mid] * countRight)
            }
        }
        
        var dp = [[Int]](repeating: [Int](repeating: Int.max / 2, count: n + 1), count: k + 1)
        dp[0][0] = 0
        
        for m in 1...k {
            for j in 1...n {
                var best = Int.max
                for i in 0..<j {
                    best = min(best, dp[m-1][i] + G[i][j-1])
                }
                dp[m][j] = best
            }
        }
        
        return dp[k][n]
    }
}
