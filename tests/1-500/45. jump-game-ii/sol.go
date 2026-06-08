func jump(nums []int) int {
    n := len(nums)
    if n <= 1 {
        return 0
    }

    jumps := 0
    currEnd := 0
    maxReach := 0

    for i := 0; i < n-1; i++ {
        if i+nums[i] > maxReach {
            maxReach = i + nums[i]
        }
        if i == currEnd {
            jumps++
            currEnd = maxReach
            if currEnd >= n-1 {
                break
            }
        }
    }

    return jumps
}
