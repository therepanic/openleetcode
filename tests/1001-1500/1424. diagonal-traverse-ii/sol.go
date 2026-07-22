func findDiagonalOrder(nums [][]int) []int {
    l := [][]int{}
    for i, row := range nums {
        for j := range row {
            l = append(l, []int{i + j, i, j})
        }
    }

    h := map[int][]int{}
    for _, triple := range l {
        sum, i, j := triple[0], triple[1], triple[2]
        h[sum] = append(h[sum], nums[i][j])
    }

    keys := []int{}
    for k := range h {
        keys = append(keys, k)
    }
    sort.Ints(keys)

    result := []int{}
    for _, k := range keys {
        diag := h[k]
        for i := len(diag) - 1; i >= 0; i-- {
            result = append(result, diag[i])
        }
    }
    return result
}
