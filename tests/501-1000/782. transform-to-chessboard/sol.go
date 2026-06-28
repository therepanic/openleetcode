func movesToChessboard(board [][]int) int {
    n := len(board)
    
    fn := func(vals []int) int {
        total := 0
        odd := 0
        for i, x := range vals {
            if vals[0] == x {
                total++
                if i&1 == 1 {
                    odd++
                }
            } else if vals[0]^x != (1<<n)-1 {
                return 1 << 30
            }
        }
        ans := 1 << 30
        if n <= 2*total && 2*total <= n+1 {
            ans = min(ans, odd)
        }
        if n-1 <= 2*total && 2*total <= n {
            ans = min(ans, total-odd)
        }
        return ans
    }
    
    rows := make([]int, n)
    cols := make([]int, n)
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if board[i][j] == 1 {
                rows[i] ^= 1 << j
                cols[j] ^= 1 << i
            }
        }
    }
    ans := fn(rows) + fn(cols)
    if ans >= 1<<30 {
        return -1
    }
    return ans
}
