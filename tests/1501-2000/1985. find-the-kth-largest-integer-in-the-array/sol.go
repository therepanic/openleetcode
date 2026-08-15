func kthLargestNumber(nums []string, k int) string {
    sort.Slice(nums, func(i, j int) bool {
        if len(nums[i]) != len(nums[j]) { return len(nums[i]) > len(nums[j]) }
        return nums[i] > nums[j]
    })
    return nums[k-1]
}
