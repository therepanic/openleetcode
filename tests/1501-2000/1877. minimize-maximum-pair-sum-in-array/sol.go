func minPairSum(nums []int) int {
    sort.Ints(nums)
    max_sum := 0
    l, r := 0, len(nums)-1
    for l < r {
        if nums[l]+nums[r] > max_sum {
            max_sum = nums[l] + nums[r]
        }
        l++
        r--
    }
    return max_sum
}
