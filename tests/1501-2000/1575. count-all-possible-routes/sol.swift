class Solution {
    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        let MOD = 1000000007
        let n = locations.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: fuel + 1), count: n)
        for city in 0..<n {
            dp[city][0] = (city == finish) ? 1 : 0
        }
        for left in 1...fuel {
            for city in 0..<n {
                var total = (city == finish) ? 1 : 0
                for nxt in 0..<n {
                    if nxt != city {
                        let cost = abs(locations[nxt] - locations[city])
                        if cost <= left {
                            total = (total + dp[nxt][left - cost]) % MOD
                        }
                    }
                }
                dp[city][left] = total
            }
        }
        return dp[start][fuel]
    }
}
