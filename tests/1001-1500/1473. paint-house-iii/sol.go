func minCost(houses []int, cost [][]int, m int, n int, target int) int {
    INF := int(1e9)
    prev := make([][]int, n)
    for c := 0; c < n; c++ {
        prev[c] = make([]int, target+1)
        for k := 0; k <= target; k++ {
            prev[c][k] = INF
        }
    }
    if houses[0] != 0 {
        c := houses[0] - 1
        prev[c][1] = 0
    } else {
        for c := 0; c < n; c++ {
            prev[c][1] = cost[0][c]
        }
    }
    for i := 1; i < m; i++ {
        curr := make([][]int, n)
        for c := 0; c < n; c++ {
            curr[c] = make([]int, target+1)
            for k := 0; k <= target; k++ {
                curr[c][k] = INF
            }
        }
        if houses[i] != 0 {
            c := houses[i] - 1
            add := 0
            for k := 1; k <= target; k++ {
                if prev[c][k] < INF {
                    if prev[c][k]+add < curr[c][k] {
                        curr[c][k] = prev[c][k] + add
                    }
                }
                if k > 1 {
                    best := INF
                    for pc := 0; pc < n; pc++ {
                        if pc != c && prev[pc][k-1] < best {
                            best = prev[pc][k-1]
                        }
                    }
                    if best < INF && best+add < curr[c][k] {
                        curr[c][k] = best + add
                    }
                }
            }
        } else {
            for c := 0; c < n; c++ {
                add := cost[i][c]
                for k := 1; k <= target; k++ {
                    if prev[c][k] < INF {
                        if prev[c][k]+add < curr[c][k] {
                            curr[c][k] = prev[c][k] + add
                        }
                    }
                    if k > 1 {
                        best := INF
                        for pc := 0; pc < n; pc++ {
                            if pc != c && prev[pc][k-1] < best {
                                best = prev[pc][k-1]
                            }
                        }
                        if best < INF && best+add < curr[c][k] {
                            curr[c][k] = best + add
                        }
                    }
                }
            }
        }
        prev = curr
    }
    ans := INF
    for c := 0; c < n; c++ {
        if prev[c][target] < ans {
            ans = prev[c][target]
        }
    }
    if ans >= INF {
        return -1
    }
    return ans
}
