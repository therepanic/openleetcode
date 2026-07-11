func spiralMatrixIII(rows int, cols int, rStart int, cStart int) [][]int {
    total := rows * cols
    res := make([][]int, 0, total)
    res = append(res, []int{rStart, cStart})
    top, bottom := rStart, rStart
    left, right := cStart, cStart
    for len(res) < total {
        right++
        for i := left + 1; i <= right; i++ {
            if top >= 0 && top < rows && i >= 0 && i < cols {
                res = append(res, []int{top, i})
                if len(res) == total {
                    return res
                }
            }
        }
        bottom++
        for i := top + 1; i <= bottom; i++ {
            if right >= 0 && right < cols && i >= 0 && i < rows {
                res = append(res, []int{i, right})
                if len(res) == total {
                    return res
                }
            }
        }
        left--
        for i := right - 1; i >= left; i-- {
            if i >= 0 && i < cols && bottom >= 0 && bottom < rows {
                res = append(res, []int{bottom, i})
                if len(res) == total {
                    return res
                }
            }
        }
        top--
        for i := bottom - 1; i >= top; i-- {
            if i >= 0 && i < rows && left >= 0 && left < cols {
                res = append(res, []int{i, left})
                if len(res) == total {
                    return res
                }
            }
        }
    }
    return res
}
