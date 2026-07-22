func maxJumps(arr []int, d int) int {
    n := len(arr)
    dp := make([]int, n)
    for i := range dp {
        dp[i] = -1
    }

    var dfs func(i int) int
    dfs = func(i int) int {
        if dp[i] != -1 {
            return dp[i]
        }

        best := 1

        // Right scan
        limit := i + d
        if limit >= n {
            limit = n - 1
        }
        for nxt := i + 1; nxt <= limit; nxt++ {
            if arr[nxt] >= arr[i] {
                break
            }
            cur := 1 + dfs(nxt)
            if cur > best {
                best = cur
            }
        }

        // Left scan
        limit = i - d
        if limit < 0 {
            limit = 0
        }
        for nxt := i - 1; nxt >= limit; nxt-- {
            if arr[nxt] >= arr[i] {
                break
            }
            cur := 1 + dfs(nxt)
            if cur > best {
                best = cur
            }
        }

        dp[i] = best
        return dp[i]
    }

    result := 0
    for i := 0; i < n; i++ {
        cur := dfs(i)
        if cur > result {
            result = cur
        }
    }
    return result
}
