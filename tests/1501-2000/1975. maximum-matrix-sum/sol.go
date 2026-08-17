func maxMatrixSum(matrix [][]int) int64 {
    totalSum := int64(0)
    neg := 0
    minAbs := int(^uint(0) >> 1) // max int
    for _, row := range matrix {
        for _, v := range row {
            if v < 0 {
                neg++
            }
            av := v
            if av < 0 {
                av = -av
            }
            totalSum += int64(av)
            if av < minAbs {
                minAbs = av
            }
        }
    }
    if neg%2 == 0 {
        return totalSum
    }
    return totalSum - 2*int64(minAbs)
}
