func countRangeSum(nums []int, lower int, upper int) int {
    sums := make([]int64, len(nums)+1)
    for i, num := range nums {
        sums[i+1] = sums[i] + int64(num)
    }
    tmp := make([]int64, len(sums))
    var sortCount func(int, int) int
    sortCount = func(lo, hi int) int {
        if hi-lo <= 1 {
            return 0
        }
        mid := (lo + hi) >> 1
        count := sortCount(lo, mid) + sortCount(mid, hi)
        r, k := mid, mid
        for i := lo; i < mid; i++ {
            for r < hi && sums[r]-sums[i] < int64(lower) {
                r++
            }
            for k < hi && sums[k]-sums[i] <= int64(upper) {
                k++
            }
            count += k - r
        }
        i, j, p := lo, mid, lo
        for i < mid || j < hi {
            if j == hi || (i < mid && sums[i] <= sums[j]) {
                tmp[p] = sums[i]
                i++
            } else {
                tmp[p] = sums[j]
                j++
            }
            p++
        }
        copy(sums[lo:hi], tmp[lo:hi])
        return count
    }
    return sortCount(0, len(sums))
}
