func subarraysDivByK(nums []int, k int) int {
    s := 0
    res := 0
    hs := map[int]int{0: 1}
    for _, num := range nums {
        s += num
        rem := s % k
        if rem < 0 {
            rem += k
        }
        res += hs[rem]
        hs[rem]++
    }
    return res
}
