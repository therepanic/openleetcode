func leastOpsExpressTarget(x int, target int) int {
    memo := make(map[int]int)
    
    var dfs func(int) int
    dfs = func(val int) int {
        if v, ok := memo[val]; ok {
            return v
        }
        if val < x {
            res := min(2*val-1, 2*(x-val))
            memo[val] = res
            return res
        }
        
        k := int(math.Log(float64(val)) / math.Log(float64(x)))
        pow := int(math.Pow(float64(x), float64(k)))
        ans := k + dfs(val-pow)
        
        nextPow := pow * x
        if nextPow < 2*val {
            ans = min(ans, k+1+dfs(nextPow-val))
        }
        
        memo[val] = ans
        return ans
    }
    
    return dfs(target)
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
