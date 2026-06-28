func constructArray(n int, k int) []int {
    ans := make([]int, 0, n)
    for i := 1; i <= n-k; i++ {
        ans = append(ans, i)
    }
    for i := 0; i < k; i++ {
        diff := i/2 + 1
        if i%2 == 0 {
            ans = append(ans, n-diff+1)
        } else {
            ans = append(ans, n-k+diff)
        }
    }
    return ans
}
