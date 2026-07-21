func kWeakestRows(mat [][]int, k int) []int {
    n := len(mat)
    type pair struct {
        idx int
        sum int
    }
    pairs := make([]pair, n)
    for i := 0; i < n; i++ {
        sum := 0
        for _, v := range mat[i] {
            sum += v
        }
        pairs[i] = pair{i, sum}
    }
    sort.Slice(pairs, func(a, b int) bool {
        if pairs[a].sum == pairs[b].sum {
            return pairs[a].idx < pairs[b].idx
        }
        return pairs[a].sum < pairs[b].sum
    })
    result := make([]int, k)
    for i := 0; i < k; i++ {
        result[i] = pairs[i].idx
    }
    return result
}
