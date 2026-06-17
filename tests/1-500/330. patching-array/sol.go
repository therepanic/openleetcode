func minPatches(nums []int, n int) int {
    currentSum := 1
    patches := 0
    index := 0
    
    for currentSum <= n {
        if index < len(nums) && nums[index] <= currentSum {
            currentSum += nums[index]
            index++
        } else {
            currentSum += currentSum
            patches++
        }
    }
    
    return patches
}
