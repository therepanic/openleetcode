func checkPartitioning(s string) bool {
    n := len(s)
    pal := make([][]bool, n)
    for i := range pal {
        pal[i] = make([]bool, n)
        pal[i][i] = true
    }
    for length := 2; length <= n; length++ {
        for i := 0; i <= n-length; i++ {
            j := i+length-1
            if s[i]==s[j] && (length==2 || pal[i+1][j-1]) {
                pal[i][j] = true
            }
        }
    }
    for i := 0; i < n-2; i++ {
        if pal[0][i] {
            for j := i+1; j < n-1; j++ {
                if pal[i+1][j] && pal[j+1][n-1] {
                    return true
                }
            }
        }
    }
    return false
}
