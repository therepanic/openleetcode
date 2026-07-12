func minHeightShelves(books [][]int, shelfWidth int) int {
    n := len(books)
    dp := make([]int, n+1)
    for i := 1; i <= n; i++ {
        dp[i] = int(^uint(0) >> 1)
    }
    dp[0] = 0
    
    for i := 1; i <= n; i++ {
        dp[i] = dp[i-1] + books[i-1][1]
        height := 0
        width := 0
        for j := i - 1; j >= 0; j-- {
            if books[j][1] > height {
                height = books[j][1]
            }
            width += books[j][0]
            if width > shelfWidth {
                break
            }
            if dp[j] + height < dp[i] {
                dp[i] = dp[j] + height
            }
        }
    }
    
    return dp[n]
}
