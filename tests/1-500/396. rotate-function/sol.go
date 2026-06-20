func maxRotateFunction(nums []int) int {
    n := len(nums)
    totalSum := 0
    F := 0
    for i := 0; i < n; i++ {
        totalSum += nums[i]
        F += i * nums[i]
    }
    result := F
    for k := 1; k < n; k++ {
        F = F + totalSum - n * nums[n - k]
        if F > result {
            result = F
        }
    }
    return result
}
