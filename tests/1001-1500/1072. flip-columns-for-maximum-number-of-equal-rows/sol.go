func maxEqualRowsAfterFlips(matrix [][]int) int {
    count := make(map[string]int)
    ans := 0

    for _, row := range matrix {
        flip := row[0]
        bytes := make([]byte, 0, len(row)*2)
        for _, x := range row {
            if x^flip == 0 {
                bytes = append(bytes, '0', ',')
            } else {
                bytes = append(bytes, '1', ',')
            }
        }
        key := string(bytes)
        count[key]++
        if count[key] > ans {
            ans = count[key]
        }
    }

    return ans
}
