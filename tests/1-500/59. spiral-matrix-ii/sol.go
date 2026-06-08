func generateMatrix(n int) [][]int {
    res := make([][]int, n)
    for i := 0; i < n; i++ {
        res[i] = make([]int, n)
    }

    top := 0
    bottom := n - 1
    left := 0
    right := n - 1
    val := 1

    for top <= bottom && left <= right {
        for col := left; col <= right; col++ {
            res[top][col] = val
            val++
        }
        top++

        for row := top; row <= bottom; row++ {
            res[row][right] = val
            val++
        }
        right--

        if top <= bottom {
            for col := right; col >= left; col-- {
                res[bottom][col] = val
                val++
            }
            bottom--
        }

        if left <= right {
            for row := bottom; row >= top; row-- {
                res[row][left] = val
                val++
            }
            left++
        }
    }

    return res
}
