func kthLargestValue(matrix [][]int, k int) int {
    n := len(matrix)
    m := len(matrix[0])
    temp := make([][]int, n)
    for i := range temp {
        temp[i] = make([]int, m)
    }
    temp[0][0] = matrix[0][0]
    for j := 1; j < m; j++ {
        temp[0][j] = temp[0][j-1] ^ matrix[0][j]
    }
    for i := 1; i < n; i++ {
        temp[i][0] = temp[i-1][0] ^ matrix[i][0]
    }
    for i := 1; i < n; i++ {
        for j := 1; j < m; j++ {
            temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1]
        }
    }
    arr := make([]int, n*m)
    idx := 0
    for i := 0; i < n; i++ {
        for j := 0; j < m; j++ {
            arr[idx] = temp[i][j]
            idx++
        }
    }
    sort.Ints(arr)
    return arr[n*m-k]
}
