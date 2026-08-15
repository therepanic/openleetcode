func maximumDifference(nums []int) int {
    minVal := nums[0]
    maxDiff := -1
    for i := 1; i < len(nums); i++ {
        if nums[i] > minVal {
            if nums[i]-minVal > maxDiff {
                maxDiff = nums[i] - minVal
            }
        } else {
            minVal = nums[i]
        }
    }
    return maxDiff
}
