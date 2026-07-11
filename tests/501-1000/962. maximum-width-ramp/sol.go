func maxWidthRamp(nums []int) int {
    n := len(nums)
    right_max := make([]int, n)
    right_max[n-1] = nums[n-1]
    
    for i := n - 2; i >= 0; i-- {
        if nums[i] > right_max[i+1] {
            right_max[i] = nums[i]
        } else {
            right_max[i] = right_max[i+1]
        }
    }
    
    i, j, result := 0, 0, 0
    for j < n {
        if nums[i] <= right_max[j] {
            if j - i > result {
                result = j - i
            }
            j++
        } else {
            i++
        }
    }
    
    return result
}
