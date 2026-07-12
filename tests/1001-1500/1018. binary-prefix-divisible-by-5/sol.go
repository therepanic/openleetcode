func prefixesDivBy5(nums []int) []bool {
    ans := make([]bool, 0, len(nums))
    val := 0
    for _, bit := range nums {
        val = (val*2 + bit) % 5
        ans = append(ans, val == 0)
    }
    return ans
}
