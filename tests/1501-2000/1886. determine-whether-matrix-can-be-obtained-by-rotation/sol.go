func findRotation(mat [][]int, target [][]int) bool {
    for i := 0; i < 4; i++ {
        if equal(mat, target) {
            return true
        }
        mat = rotate(mat)
    }
    return false
}

func equal(a, b [][]int) bool {
    if len(a) != len(b) || len(a[0]) != len(b[0]) {
        return false
    }
    for i := range a {
        for j := range a[i] {
            if a[i][j] != b[i][j] {
                return false
            }
        }
    }
    return true
}

func rotate(mat [][]int) [][]int {
    n := len(mat)
    res := make([][]int, n)
    for i := range res {
        res[i] = make([]int, n)
    }
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            res[j][n-1-i] = mat[i][j]
        }
    }
    return res
}
