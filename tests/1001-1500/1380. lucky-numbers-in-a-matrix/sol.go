func luckyNumbers(matrix [][]int) []int {
    rows := len(matrix)
    cols := len(matrix[0])
    ans := make([]int, 0)
    for i := 0; i < rows; i++ {
        for j := 0; j < cols; j++ {
            ele1 := matrix[i][0]
            for k := 1; k < cols; k++ {
                if matrix[i][k] < ele1 {
                    ele1 = matrix[i][k]
                }
            }
            ele2 := matrix[0][j]
            for k := 1; k < rows; k++ {
                if matrix[k][j] > ele2 {
                    ele2 = matrix[k][j]
                }
            }
            if ele1 == matrix[i][j] && ele2 == matrix[i][j] {
                ans = append(ans, matrix[i][j])
            }
        }
    }
    return ans
}
