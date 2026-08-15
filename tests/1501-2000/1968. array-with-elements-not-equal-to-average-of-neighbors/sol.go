func rearrangeArray(nums []int) []int {
    sort.Ints(nums)
    res := make([]int, len(nums))
    mid := (len(nums) + 1) / 2
    j := 0
    for i := 0; i < len(nums); i += 2 {
        res[i] = nums[j]
        j++
    }
    j = mid
    for i := 1; i < len(nums); i += 2 {
        res[i] = nums[j]
        j++
    }
    return res
}
