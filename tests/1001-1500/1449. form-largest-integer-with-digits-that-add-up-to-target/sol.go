func largestNumber(cost []int, target int) string {
    N := len(cost)
    memo := make([][]int, N+1)
    for i := range memo {
        memo[i] = make([]int, target+1)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    
    var helper func(int, int) int
    helper = func(i, c int) int {
        if c == 0 {
            return 0
        }
        if i == N || c < 0 {
            return -2147483648
        }
        if memo[i][c] != -1 {
            return memo[i][c]
        }
        take := helper(i, c-cost[i])
        if take != -2147483648 {
            take += 1
        }
        notTake := helper(i+1, c)
        if take > notTake {
            memo[i][c] = take
        } else {
            memo[i][c] = notTake
        }
        return memo[i][c]
    }
    
    e := helper(0, target)
    if e == -2147483648 {
        return "0"
    }
    
    var s []byte
    t := target
    for k := 0; k < e; k++ {
        for j := 9; j >= 1; j-- {
            if cost[j-1] <= t && helper(0, t-cost[j-1]) == e-k-1 {
                t -= cost[j-1]
                s = append(s, byte('0'+j))
                break
            }
        }
    }
    return string(s)
}
