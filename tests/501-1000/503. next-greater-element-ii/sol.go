func nextGreaterElements(nums []int) []int {
    n := len(nums)
    res := make([]int, n)
    for i := 0; i < n; i++ {
        res[i] = -1
        for j := i + 1; j < n; j++ {
            if nums[j] > nums[i] {
                res[i] = nums[j]
                break
            }
        }
        if res[i] == -1 {
            for j := 0; j < i; j++ {
                if nums[j] > nums[i] {
                    res[i] = nums[j]
                    break
                }
            }
        }
    }
    return res
}
