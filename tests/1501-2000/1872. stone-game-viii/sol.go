func stoneGameVIII(stones []int) int {
    n := len(stones)
    prefix := make([]int, n)
    copy(prefix, stones)
    for i := 1; i < n; i++ {
        prefix[i] += prefix[i-1]
    }
    
    memo := make([]int, n)
    for i := range memo {
        memo[i] = -1 << 31
    }
    
    var rec func(int) int
    rec = func(i int) int {
        if i == n-2 {
            return prefix[i+1]
        }
        if memo[i] != -1<<31 {
            return memo[i]
        }
        aliceCont := rec(i+1)
        aliceDone := prefix[i+1] - rec(i+1)
        if aliceCont > aliceDone {
            memo[i] = aliceCont
        } else {
            memo[i] = aliceDone
        }
        return memo[i]
    }
    
    return rec(0)
}
