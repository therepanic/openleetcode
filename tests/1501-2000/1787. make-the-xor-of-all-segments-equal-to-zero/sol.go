func minChanges(nums []int, k int) int {
    freq := make(map[int]map[int]int)
    for i, x := range nums {
        rem := i % k
        if freq[rem] == nil {
            freq[rem] = make(map[int]int)
        }
        freq[rem][x]++
    }
    
    n := 1 << 10
    dp := make([]int, n)
    for i := 1; i < n; i++ {
        dp[i] = -1 << 60
    }
    for i := 0; i < k; i++ {
        mx := -1 << 60
        for _, v := range dp {
            if v > mx {
                mx = v
            }
        }
        tmp := make([]int, n)
        for x := 0; x < n; x++ {
            c := dp[x]
            for xx, cc := range freq[i] {
                idx := x ^ xx
                if c + cc > tmp[idx] {
                    tmp[idx] = c + cc
                }
                if mx > tmp[idx] {
                    tmp[idx] = mx
                }
            }
        }
        dp = tmp
    }
    return len(nums) - dp[0]
}
