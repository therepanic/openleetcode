func findDuplicates(nums []int) []int {
    r := []int{}
    for _, x := range nums {
        idx := abs(x) - 1
        if nums[idx] < 0 {
            r = append(r, abs(x))
        } else {
            nums[idx] = -nums[idx]
        }
    }
    return r
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
