func kthSmallest(mat [][]int, k int) int {
    sums := make([]int, 0)
    for i := 0; i < len(mat[0]) && i < k; i++ {
        sums = append(sums, mat[0][i])
    }
    for r := 1; r < len(mat); r++ {
        row := mat[r]
        next := make([]int, 0)
        for _, a := range sums {
            for j := 0; j < len(row) && j < k; j++ {
                next = append(next, a + row[j])
            }
        }
        sort.Ints(next)
        if len(next) > k {
            next = next[:k]
        }
        sums = next
    }
    return sums[k-1]
}
