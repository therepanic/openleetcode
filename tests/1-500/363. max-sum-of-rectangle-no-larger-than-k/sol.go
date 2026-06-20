import (
    "math"
    "sort"
)

func maxSumSubmatrix(matrix [][]int, k int) int {
    m := len(matrix)
    n := len(matrix[0])
    ans := math.MinInt32
    for left := 0; left < n; left++ {
        rowSum := make([]int, m)
        for right := left; right < n; right++ {
            for i := 0; i < m; i++ {
                rowSum[i] += matrix[i][right]
            }
            s := []int{0}
            curr := 0
            for _, x := range rowSum {
                curr += x
                target := curr - k
                idx := sort.SearchInts(s, target)
                if idx < len(s) && s[idx] >= target {
                    if curr - s[idx] > ans {
                        ans = curr - s[idx]
                    }
                }
                idxInsert := sort.SearchInts(s, curr)
                s = append(s, 0)
                copy(s[idxInsert+1:], s[idxInsert:])
                s[idxInsert] = curr
            }
        }
    }
    return ans
}
