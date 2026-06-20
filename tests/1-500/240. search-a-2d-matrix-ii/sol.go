func searchMatrix(matrix [][]int, target int) bool {
    v := false
    for _, i := range matrix {
        for j := 0; j < len(i); j++ {
            if i[j] == target {
                v = true
            }
        }
    }
    return v
}
