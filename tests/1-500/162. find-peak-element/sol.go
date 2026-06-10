func findPeakElement(nums []int) int {
    n := len(nums)
    if n < 3 {
        if nums[0] >= nums[n-1] {
            return 0
        }
        return n - 1
    }
    left, right := 0, n-1
    for left < right {
        mid := left + (right-left)/2
        if mid > 0 && mid < n-1 && nums[mid-1] < nums[mid] && nums[mid] > nums[mid+1] {
            return mid
        }
        if nums[mid] < nums[mid+1] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}
