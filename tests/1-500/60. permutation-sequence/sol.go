func getPermutation(n int, k int) string {
    nums := make([]int, 0, n)
    factorial := make([]int, n+1)
    factorial[0] = 1

    for i := 1; i <= n; i++ {
        nums = append(nums, i)
        factorial[i] = factorial[i-1] * i
    }

    k--
    res := make([]byte, 0, n)
    for remaining := n; remaining >= 1; remaining-- {
        block := factorial[remaining-1]
        idx := k / block
        k %= block
        res = append(res, byte('0'+nums[idx]))
        nums = append(nums[:idx], nums[idx+1:]...)
    }
    return string(res)
}
