func maxAscendingSum(nums []int) int {
    curr, ans := nums[0], nums[0]
    for i := 1; i < len(nums); i++ {
        if nums[i] > nums[i-1] {
            curr += nums[i]
        } else {
            curr = nums[i]
        }
        if curr > ans {
            ans = curr
        }
    }
    return ans
}
