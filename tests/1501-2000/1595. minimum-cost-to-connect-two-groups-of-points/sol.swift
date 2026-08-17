class Solution {
    func connectTwoGroups(_ cost: [[Int]]) -> Int {
        let m = cost.count
        let n = cost[0].count
        var mn = [Int](repeating: 0, count: n)
        for j in 0..<n {
            var minVal = cost[0][j]
            for i in 1..<m {
                minVal = min(minVal, cost[i][j])
            }
            mn[j] = minVal
        }
        var memo = [[Int]](repeating: [Int](repeating: -1, count: 1<<n), count: m+1)
        func fn(_ i: Int, _ mask: Int) -> Int {
            if memo[i][mask] != -1 { return memo[i][mask] }
            if i == m {
                var sum = 0
                for j in 0..<n {
                    if (mask & (1<<j)) == 0 { sum += mn[j] }
                }
                memo[i][mask] = sum
            } else {
                var best = Int.max
                for j in 0..<n {
                    best = min(best, cost[i][j] + fn(i+1, mask | (1<<j)))
                }
                memo[i][mask] = best
            }
            return memo[i][mask]
        }
        return fn(0, 0)
    }
}
