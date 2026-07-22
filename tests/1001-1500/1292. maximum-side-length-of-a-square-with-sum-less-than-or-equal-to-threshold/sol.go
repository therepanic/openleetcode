func maxSideLength(mat [][]int, threshold int) int {
    n := len(mat)
    m := len(mat[0])
    pref := make([][]int, n)
    for i := 0; i < n; i++ {
        pref[i] = make([]int, m)
        copy(pref[i], mat[i])
    }
    for i := 0; i < n; i++ {
        for j := 1; j < m; j++ {
            pref[i][j] += pref[i][j-1]
        }
    }
    for j := 0; j < m; j++ {
        for i := 1; i < n; i++ {
            pref[i][j] += pref[i-1][j]
        }
    }
    isValid := func(k int) bool {
        for i := k - 1; i < n; i++ {
            for j := k - 1; j < m; j++ {
                x1 := i - k + 1
                y1 := j - k + 1
                total := pref[i][j]
                if x1 > 0 {
                    total -= pref[x1-1][j]
                }
                if y1 > 0 {
                    total -= pref[i][y1-1]
                }
                if x1 > 0 && y1 > 0 {
                    total += pref[x1-1][y1-1]
                }
                if total <= threshold {
                    return true
                }
            }
        }
        return false
    }
    low, high := 1, min(n, m)
    ans := 0
    for low <= high {
        mid := (low + high) / 2
        if isValid(mid) {
            ans = mid
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return ans
}
