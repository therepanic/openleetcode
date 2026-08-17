class Solution {
    func maxScore(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [[Int]](repeating: [Int](repeating: -1, count: n/2 + 1), count: 1 << n)

        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }

        func dfs(_ mask: Int, _ op: Int) -> Int {
            if mask == (1 << n) - 1 {
                return 0
            }
            if dp[mask][op] != -1 {
                return dp[mask][op]
            }
            var ans = 0
            for i in 0..<n {
                if (mask & (1 << i)) == 0 {
                    for j in 0..<n {
                        if j != i && (mask & (1 << j)) == 0 {
                            let nmask = mask | (1 << i) | (1 << j)
                            let val = dfs(nmask, op + 1) + gcd(nums[i], nums[j]) * op
                            ans = max(ans, val)
                        }
                    }
                }
            }
            dp[mask][op] = ans
            return ans
        }

        return dfs(0, 1)
    }
}
