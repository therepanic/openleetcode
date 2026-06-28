func findLongestChain(pairs [][]int) int {
    sort.Slice(pairs, func(i, j int) bool {
        return pairs[i][1] < pairs[j][1]
    })
    prev := pairs[0]
    res := 1
    for _, cur := range pairs[1:] {
        if cur[0] > prev[1] {
            res++
            prev = cur
        }
    }
    return res
}
