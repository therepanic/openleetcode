class Solution {
    func knightDialer(_ n: Int) -> Int {
        if n == 1 {
            return 10
        }
        
        var dp = [Int](repeating: 1, count: 10)
        let mapping: [[Int]] = [
            [4, 6],
            [6, 8],
            [7, 9],
            [4, 8],
            [0, 3, 9],
            [],
            [0, 1, 7],
            [2, 6],
            [1, 3],
            [2, 4]
        ]
        
        let MOD = 1000000007
        
        for _ in 0..<(n - 1) {
            var newDp = [Int](repeating: 0, count: 10)
            for i in 0..<10 {
                for digit in mapping[i] {
                    newDp[digit] = (newDp[digit] + dp[i]) % MOD
                }
            }
            dp = newDp
        }
        
        return dp.reduce(0) { ($0 + $1) % MOD }
    }
}
