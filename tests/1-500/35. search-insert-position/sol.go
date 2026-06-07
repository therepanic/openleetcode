func searchInsert(nums []int, target int) int {
    low := 0
    high := len(nums) - 1

    for low <= high {
        mid := low + (high-low)/2
        if nums[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    return low
}
