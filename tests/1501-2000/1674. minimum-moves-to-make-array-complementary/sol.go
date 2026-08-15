func minMoves(nums []int, limit int) int {
    n := len(nums)
    diff := make([]int, 2*limit+2)
    
    for i := 0; i < n/2; i++ {
        a := nums[i]
        b := nums[n-1-i]
        low := min(a, b) + 1
        high := max(a, b) + limit
        total := a + b
        
        diff[2] += 2
        diff[2*limit+1] -= 2
        
        diff[low] -= 1
        diff[high+1] += 1
        
        diff[total] -= 1
        diff[total+1] += 1
    }
    
    ans := int(^uint(0) >> 1) // MaxInt
    moves := 0
    for target := 2; target <= 2*limit; target++ {
        moves += diff[target]
        if moves < ans {
            ans = moves
        }
    }
    
    return ans
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
