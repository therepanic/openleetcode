func missingNumber(nums []int) int {
    l := len(nums)
    total := l
    summ := 0
    for i := 0; i < l; i++ {
        total += i
        summ += nums[i]
    }
    return total - summ
}
