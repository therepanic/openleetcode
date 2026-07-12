func numFriendRequests(ages []int) int {
    cnt := make([]int, 121)
    for _, age := range ages {
        cnt[age]++
    }
    pre := make([]int, 122)
    for i := 0; i < 121; i++ {
        pre[i+1] = pre[i] + cnt[i]
    }
    ans := 0
    for age := 15; age < 121; age++ {
        if cnt[age] > 0 {
            lower := int(float64(age)*0.5 + 7)
            total := pre[age+1] - pre[lower+1]
            ans += cnt[age] * (total - 1)
        }
    }
    return ans
}
