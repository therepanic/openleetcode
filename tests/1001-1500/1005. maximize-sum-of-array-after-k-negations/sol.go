func largestSumAfterKNegations(nums []int, k int) int {
    sort.Ints(nums)
    for i := 0; i < len(nums); i++ {
        if nums[i] < 0 && k > 0 {
            nums[i] = -nums[i]
            k--
        }
    }
    sort.Ints(nums)
    if k > 0 && k % 2 != 0 {
        nums[0] = -nums[0]
    }
    sum := 0
    for _, num := range nums {
        sum += num
    }
    return sum
}
