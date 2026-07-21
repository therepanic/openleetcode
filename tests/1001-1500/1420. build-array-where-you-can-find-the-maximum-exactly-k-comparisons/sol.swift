class Solution {
    private let MOD = 1_000_000_007
    private var dp: [[[Int]]] = []
    private var n = 0
    private var m = 0
    private var k = 0

    func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        self.n = n
        self.m = m
        self.k = k
        dp = Array(repeating: Array(repeating: Array(repeating: -1, count: m + 1), count: k + 1), count: n + 1)
        return solve(0, 0, 0)
    }

    private func solve(_ idx: Int, _ searchCost: Int, _ maxValue: Int) -> Int {
        if idx == n {
            return searchCost == k ? 1 : 0
        }
        if searchCost > k {
            return 0
        }
        if dp[idx][searchCost][maxValue] != -1 {
            return dp[idx][searchCost][maxValue]
        }

        var result = 0
        for i in 1...m {
            if i > maxValue {
                result = (result + solve(idx + 1, searchCost + 1, i)) % MOD
            } else {
                result = (result + solve(idx + 1, searchCost, maxValue)) % MOD
            }
        }

        dp[idx][searchCost][maxValue] = result
        return result
    }
}
