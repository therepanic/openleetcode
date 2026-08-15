func mostCompetitive(nums []int, k int) []int {
    stack := make([]int, 0, k)
    n := len(nums)
    for i := 0; i < n; i++ {
        for len(stack) > 0 && stack[len(stack)-1] > nums[i] {
            if n-1-i >= k-len(stack) {
                stack = stack[:len(stack)-1]
            } else {
                break
            }
        }
        stack = append(stack, nums[i])
    }
    return stack[:k]
}
