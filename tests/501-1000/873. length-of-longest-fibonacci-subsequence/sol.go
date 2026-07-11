func lenLongestFibSubseq(arr []int) int {
    n := len(arr)
    dp := make([][]int, n)
    for i := range dp {
        dp[i] = make([]int, n)
    }
    maxLen := 0
    
    for curr := 2; curr < n; curr++ {
        start := 0
        end := curr - 1
        
        for start < end {
            pairSum := arr[start] + arr[end]
            
            if pairSum > arr[curr] {
                end--
            } else if pairSum < arr[curr] {
                start++
            } else {
                dp[end][curr] = dp[start][end] + 1
                if dp[end][curr] > maxLen {
                    maxLen = dp[end][curr]
                }
                end--
                start++
            }
        }
    }
    
    if maxLen > 0 {
        return maxLen + 2
    }
    return 0
}
