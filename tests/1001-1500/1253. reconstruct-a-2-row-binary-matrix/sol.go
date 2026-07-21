func reconstructMatrix(upper int, lower int, colsum []int) [][]int {
    sum := 0
    for _, c := range colsum {
        sum += c
    }
    if upper+lower != sum {
        return [][]int{}
    }
    
    n := len(colsum)
    row1 := make([]int, n)
    row2 := make([]int, n)
    
    for i := 0; i < n; i++ {
        if colsum[i] == 2 {
            row1[i] = 1
            row2[i] = 1
            upper--
            lower--
        } else if colsum[i] == 1 {
            if upper > lower {
                row1[i] = 1
                upper--
            } else {
                row2[i] = 1
                lower--
            }
        }
    }
    
    if lower == 0 && upper == 0 {
        return [][]int{row1, row2}
    }
    return [][]int{}
}
