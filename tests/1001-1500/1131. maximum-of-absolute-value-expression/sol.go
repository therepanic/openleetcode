func maxAbsValExpr(arr1 []int, arr2 []int) int {
    res := 0
    n := len(arr1)
    signs := [][]int{{1, 1}, {1, -1}, {-1, 1}, {-1, -1}}

    for _, sign := range signs {
        p, q := sign[0], sign[1]
        maxVal := int(-1e9)
        minVal := int(1e9)
        for i := 0; i < n; i++ {
            value := p*arr1[i] + q*arr2[i] + i
            if value > maxVal {
                maxVal = value
            }
            if value < minVal {
                minVal = value
            }
        }
        if maxVal - minVal > res {
            res = maxVal - minVal
        }
    }

    return res
}
