func searchRange(nums []int, target int) []int {
    bound := func(left bool) int {
        low := 0
        high := len(nums) - 1
        ans := -1

        for low <= high {
            mid := low + (high-low)/2
            if nums[mid] < target {
                low = mid + 1
            } else if nums[mid] > target {
                high = mid - 1
            } else {
                ans = mid
                if left {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }

        return ans
    }

    return []int{bound(true), bound(false)}
}
