func sumOfBeauties(nums []int) int {
    n := len(nums)
    prefix := make([]int, n)
    suffix := make([]int, n)
    prefix[0] = nums[0]
    suffix[n-1] = nums[n-1]
    for i := 1; i < n; i++ {
        if nums[i-1] > prefix[i-1] {
            prefix[i] = nums[i-1]
        } else {
            prefix[i] = prefix[i-1]
        }
    }
    for i := n-2; i >= 0; i-- {
        if nums[i+1] < suffix[i+1] {
            suffix[i] = nums[i+1]
        } else {
            suffix[i] = suffix[i+1]
        }
    }
    ans := 0
    for i := 1; i < n-1; i++ {
        if prefix[i] < nums[i] && nums[i] < suffix[i] {
            ans += 2
        } else if nums[i-1] < nums[i] && nums[i] < nums[i+1] {
            ans += 1
        }
    }
    return ans
}
