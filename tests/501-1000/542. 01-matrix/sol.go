func updateMatrix(mat [][]int) [][]int {
    rows := len(mat)
    cols := len(mat[0])
    directions := [][]int{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}
    queue := make([][]int, 0)

    for i := 0; i < rows; i++ {
        for j := 0; j < cols; j++ {
            if mat[i][j] == 0 {
                queue = append(queue, []int{i, j})
            } else {
                mat[i][j] = math.MaxInt32
            }
        }
    }

    for len(queue) > 0 {
        cell := queue[0]
        queue = queue[1:]
        row, col := cell[0], cell[1]

        for _, dir := range directions {
            newRow, newCol := row+dir[0], col+dir[1]

            if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols && mat[newRow][newCol] > mat[row][col]+1 {
                mat[newRow][newCol] = mat[row][col] + 1
                queue = append(queue, []int{newRow, newCol})
            }
        }
    }

    return mat
}
