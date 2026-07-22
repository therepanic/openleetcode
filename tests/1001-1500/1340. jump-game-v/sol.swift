class Solution {
    func maxJumps(_ arr: [Int], _ d: Int) -> Int {
        let n = arr.count
        var dp = [Int](repeating: -1, count: n)

        func dfs(_ i: Int) -> Int {
            if dp[i] != -1 {
                return dp[i]
            }

            var best = 1

            // Right scan
            if i + 1 < n {
                for nxt in (i + 1)...min(n - 1, i + d) {
                    if arr[nxt] >= arr[i] {
                        break
                    }
                    best = max(best, 1 + dfs(nxt))
                }
            }

            // Left scan
            if i > 0 {
                for nxt in stride(from: i - 1, through: max(0, i - d), by: -1) {
                    if arr[nxt] >= arr[i] {
                        break
                    }
                    best = max(best, 1 + dfs(nxt))
                }
            }

            dp[i] = best
            return dp[i]
        }

        var result = 0
        for i in 0..<n {
            result = max(result, dfs(i))
        }
        return result
    }
}
