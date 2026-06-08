func spiralOrder(matrix [][]int) []int {
    res := []int{}
    top := 0
    bottom := len(matrix) - 1
    left := 0
    right := len(matrix[0]) - 1

    for top <= bottom && left <= right {
        for col := left; col <= right; col++ {
            res = append(res, matrix[top][col])
        }
        top++

        for row := top; row <= bottom; row++ {
            res = append(res, matrix[row][right])
        }
        right--

        if top <= bottom {
            for col := right; col >= left; col-- {
                res = append(res, matrix[bottom][col])
            }
            bottom--
        }

        if left <= right {
            for row := bottom; row >= top; row-- {
                res = append(res, matrix[row][left])
            }
            left++
        }
    }

    return res
}
