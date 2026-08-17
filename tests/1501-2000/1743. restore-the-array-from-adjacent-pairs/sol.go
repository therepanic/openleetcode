func restoreArray(adjacentPairs [][]int) []int {
    xorMap := make(map[int]int)
    degree := make(map[int]int)

    for _, pair := range adjacentPairs {
        u, v := pair[0], pair[1]
        xorMap[u] ^= v
        xorMap[v] ^= u
        degree[u]++
        degree[v]++
    }

    start := 0
    for k, v := range degree {
        if v == 1 {
            start = k
            break
        }
    }

    n := len(adjacentPairs) + 1
    res := make([]int, n)

    res[0] = start
    prev := 0

    for i := 1; i < n; i++ {
        res[i] = xorMap[res[i-1]] ^ prev
        prev = res[i-1]
    }

    return res
}
