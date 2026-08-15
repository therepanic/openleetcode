func countSubstrings(s string, t string) int {
    m, n := len(s), len(t)
    result := 0

    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            diff := 0
            k := 0
            for i+k < m && j+k < n {
                if s[i+k] != t[j+k] {
                    diff++
                }
                if diff > 1 {
                    break
                }
                if diff == 1 {
                    result++
                }
                k++
            }
        }
    }

    return result
}
