func findDisappearedNumbers(nums []int) []int {
    for i := 0; i < len(nums); i++ {
        idx := abs(nums[i]) - 1
        if nums[idx] > 0 {
            nums[idx] *= -1
        }
    }
    res := []int{}
    for i := 0; i < len(nums); i++ {
        if nums[i] > 0 {
            res = append(res, i+1)
        }
    }
    return res
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
