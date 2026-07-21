func processQueries(queries []int, m int) []int {
    ans := make([]int, len(queries))
    arr := make([]int, m)
    for i := 1; i <= m; i++ {
        arr[i-1] = i
    }
    for i, x := range queries {
        idx := -1
        for j, v := range arr {
            if v == x {
                idx = j
                break
            }
        }
        ans[i] = idx
        arr = append(arr[:idx], arr[idx+1:]...)
        arr = append([]int{x}, arr...)
    }
    return ans
}
