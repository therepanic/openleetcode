func triangleNumber(nums []int) int {
    sort.Ints(nums)
    n := len(nums)
    count := 0
    for i := n - 1; i >= 0; i-- {
        left, right := 0, i - 1
        for left < right {
            if nums[left] + nums[right] > nums[i] {
                count += right - left
                right--
            } else {
                left++
            }
        }
    }
    return count
}
