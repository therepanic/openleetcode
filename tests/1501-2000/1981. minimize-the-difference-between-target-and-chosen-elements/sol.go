func minimizeTheDifference(mat [][]int, target int) int {
    for _, row := range mat {
        sort.Ints(row)
    }
    dp := make(map[[2]int]int)
    mini := int(^uint(0) >> 1) // max int
    
    var dfs func(i, ans int) int
    dfs = func(i, ans int) int {
        if i < 0 {
            diff := ans
            if diff < 0 {
                diff = -diff
            }
            if diff < mini {
                mini = diff
            }
            return diff
        }
        key := [2]int{i, ans}
        if val, ok := dp[key]; ok {
            return val
        }
        if ans < 0 && (-ans) > mini {
            return int(^uint(0) >> 1) / 2
        }
        take := int(^uint(0) >> 1) / 2
        for z := 0; z < len(mat[i]); z++ {
            if z > 0 && mat[i][z] == mat[i][z-1] {
                continue
            }
            res := dfs(i-1, ans - mat[i][z])
            if res < take {
                take = res
            }
            if take == 0 {
                break
            }
        }
        dp[key] = take
        return take
    }
    
    return dfs(len(mat)-1, target)
}
