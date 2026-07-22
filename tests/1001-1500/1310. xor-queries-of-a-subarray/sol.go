func xorQueries(arr []int, queries [][]int) []int {
    n := len(arr)
    prefix := make([]int, n+1)
    for i := 0; i < n; i++ {
        prefix[i+1] = prefix[i] ^ arr[i]
    }
    ans := make([]int, len(queries))
    for i, q := range queries {
        a, b := q[0], q[1]
        ans[i] = prefix[b+1] ^ prefix[a]
    }
    return ans
}
