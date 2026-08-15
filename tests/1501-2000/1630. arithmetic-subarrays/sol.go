func checkArithmeticSubarrays(nums []int, l []int, r []int) []bool {
    ans := make([]bool, len(l))
    for i := 0; i < len(l); i++ {
        sub := make([]int, r[i]-l[i]+1)
        copy(sub, nums[l[i]:r[i]+1])
        sort.Ints(sub)
        valid := true
        if len(sub) > 2 {
            d := sub[1] - sub[0]
            for j := 1; j < len(sub)-1; j++ {
                if sub[j+1] - sub[j] != d {
                    valid = false
                    break
                }
            }
        }
        ans[i] = valid
    }
    return ans
}
