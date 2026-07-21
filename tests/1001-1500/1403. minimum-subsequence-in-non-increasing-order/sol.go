func minSubsequence(nums []int) []int {
    sort.Ints(nums)
    v := []int{}
    l := len(nums)
    sumV, sumRem := 0, 0
    for _, x := range nums {
        sumRem += x
    }
    for sumV <= sumRem {
        l--
        sumV += nums[l]
        sumRem -= nums[l]
        v = append(v, nums[l])
    }
    return v
}
