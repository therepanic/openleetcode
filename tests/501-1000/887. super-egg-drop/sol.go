func superEggDrop(k int, n int) int {
    memo := make([][]int, k+1)
    for i := range memo {
        memo[i] = make([]int, n+1)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    
    var solve func(int, int) int
    solve = func(eggs, floors int) int {
        if floors <= 1 || eggs == 1 {
            return floors
        }
        if memo[eggs][floors] != -1 {
            return memo[eggs][floors]
        }
        
        low, high := 1, floors
        ans := floors
        
        for low <= high {
            mid := (low + high) / 2
            breakCase := solve(eggs-1, mid-1)
            notBreakCase := solve(eggs, floors-mid)
            
            cur := 1 + max(breakCase, notBreakCase)
            if cur < ans {
                ans = cur
            }
            if breakCase < notBreakCase {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        memo[eggs][floors] = ans
        return ans
    }
    
    return solve(k, n)
}
