func stoneGameV(stoneValue []int) int {
    n := len(stoneValue)
    sv := make([]int, n+1)
    for i := 0; i < n; i++ {
        sv[i+1] = sv[i] + stoneValue[i]
    }
    memo := make([][]int, n+1)
    for i := range memo {
        memo[i] = make([]int, n+1)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    return helper(sv, 0, n, memo)
}

func helper(sv []int, fro, to int, memo [][]int) int {
    if to - fro == 1 {
        return 0
    }
    if memo[fro][to] != -1 {
        return memo[fro][to]
    }
    
    target := (sv[to] + sv[fro]) / 2
    lo, hi := fro, to
    for lo < hi {
        mid := (lo + hi) / 2
        if sv[mid] < target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    mid := lo
    
    dist := 0
    res := 0
    exploreMore := true
    for exploreMore {
        exploreMore = false
        candidates := []int{mid - dist, mid + dist}
        for _, i := range candidates {
            if fro < i && i <= to {
                left := sv[i] - sv[fro]
                right := sv[to] - sv[i]
                if res/2 <= left && left <= right {
                    res = max(res, left + helper(sv, fro, i, memo))
                    exploreMore = true
                }
                if left >= right && right >= res/2 {
                    res = max(res, right + helper(sv, i, to, memo))
                    exploreMore = true
                }
            }
        }
        dist++
    }
    memo[fro][to] = res
    return res
}

func max(a, b int) int {
    if a > b { return a }
    return b
}
