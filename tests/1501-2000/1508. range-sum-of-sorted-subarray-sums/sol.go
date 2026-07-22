func rangeSum(nums []int, n int, left int, right int) int {
    const MOD = 1000000007
    sums := make([]int64, 0, n*(n+1)/2)
    for i := 0; i < n; i++ {
        var total int64 = 0
        for _, v := range nums[i:] {
            total += int64(v)
            sums = append(sums, total)
        }
    }
    sort.Slice(sums, func(i, j int) bool { return sums[i] < sums[j] })
    var result int64 = 0
    for i := left - 1; i < right; i++ {
        result = (result + sums[i]) % MOD
    }
    return int(result)
}
