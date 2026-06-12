
func generate(numRows int) [][]int {
    result := make([][]int, 0, numRows)
    for i := 0; i < numRows; i++ {
        row := make([]int, i+1)
        for j := range row {
            row[j] = 1
        }
        for j := 1; j < i; j++ {
            row[j] = result[i-1][j-1] + result[i-1][j]
        }
        result = append(result, row)
    }
    return result
}
