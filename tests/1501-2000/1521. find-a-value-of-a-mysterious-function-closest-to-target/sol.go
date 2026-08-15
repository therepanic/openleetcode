func closestToTarget(arr []int, target int) int {
    n := len(arr)
    LOG := int(math.Log2(float64(n))) + 1
    st := make([][]int, n)
    for i := range st {
        st[i] = make([]int, LOG)
        st[i][0] = arr[i]
    }
    for j := 1; j < LOG; j++ {
        for i := 0; i + (1 << j) <= n; i++ {
            st[i][j] = st[i][j-1] & st[i + (1 << (j-1))][j-1]
        }
    }
    logs := make([]int, n+1)
    for i := 2; i <= n; i++ {
        logs[i] = logs[i/2] + 1
    }
    
    res := int(^uint(0) >> 1) // max int
    for l := 0; l < n; l++ {
        left, right := l, n-1
        for left <= right {
            mid := (left + right) / 2
            k := logs[mid-l+1]
            val := st[l][k] & st[mid - (1 << k) + 1][k]
            diff := val - target
            if diff < 0 {
                diff = -diff
            }
            if diff < res {
                res = diff
            }
            if val >= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return res
}
