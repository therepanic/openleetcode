func removeBoxes(boxes []int) int {
    type group struct {
        color int
        count int
    }
    
    var groups []group
    i := 0
    for i < len(boxes) {
        color := boxes[i]
        count := 0
        for i < len(boxes) && boxes[i] == color {
            count++
            i++
        }
        groups = append(groups, group{color, count})
    }
    
    n := len(groups)
    dp := make([][][]int, n)
    for i := range dp {
        dp[i] = make([][]int, n)
        for j := range dp[i] {
            dp[i][j] = make([]int, len(boxes)+1)
        }
    }
    
    var dfs func(l, r, k int) int
    dfs = func(l, r, k int) int {
        if l > r {
            return 0
        }
        if dp[l][r][k] != 0 {
            return dp[l][r][k]
        }
        
        color := groups[l].color
        count := groups[l].count + k
        res := count*count + dfs(l+1, r, 0)
        
        for i := l + 1; i <= r; i++ {
            if groups[i].color == color {
                left := dfs(l+1, i-1, 0)
                right := dfs(i, r, count)
                if left+right > res {
                    res = left + right
                }
            }
        }
        
        dp[l][r][k] = res
        return res
    }
    
    return dfs(0, n-1, 0)
}
