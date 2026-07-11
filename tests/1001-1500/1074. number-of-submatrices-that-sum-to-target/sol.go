func numSubmatrixSumTarget(matrix [][]int, target int) int {
    m, n := len(matrix), len(matrix[0])
    for row := 0; row < m; row++ {
        for col := 1; col < n; col++ {
            matrix[row][col] += matrix[row][col-1]
        }
    }
    count := 0
    for c1 := 0; c1 < n; c1++ {
        for c2 := c1; c2 < n; c2++ {
            prefixSumMap := map[int]int{0: 1}
            sumVal := 0
            for row := 0; row < m; row++ {
                if c1 > 0 {
                    sumVal += matrix[row][c2] - matrix[row][c1-1]
                } else {
                    sumVal += matrix[row][c2]
                }
                count += prefixSumMap[sumVal-target]
                prefixSumMap[sumVal]++
            }
        }
    }
    return count
}
