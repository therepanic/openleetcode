func allCellsDistOrder(rows int, cols int, rCenter int, cCenter int) [][]int {
    result := make([][]int, 0, rows*cols)
    for r := 0; r < rows; r++ {
        for c := 0; c < cols; c++ {
            result = append(result, []int{r, c})
        }
    }
    sort.Slice(result, func(i, j int) bool {
        d1 := abs(result[i][0]-rCenter) + abs(result[i][1]-cCenter)
        d2 := abs(result[j][0]-rCenter) + abs(result[j][1]-cCenter)
        if d1 != d2 {
            return d1 < d2
        }
        if result[i][0] != result[j][0] {
            return result[i][0] < result[j][0]
        }
        return result[i][1] < result[j][1]
    })
    return result
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
