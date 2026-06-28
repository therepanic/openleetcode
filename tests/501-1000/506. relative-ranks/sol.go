func findRelativeRanks(score []int) []string {
    n := len(score)
    sorted := make([]int, n)
    copy(sorted, score)
    sort.Slice(sorted, func(i, j int) bool {
        return sorted[i] > sorted[j]
    })
    ranks := make(map[int]string)
    for i := 0; i < n; i++ {
        ranks[sorted[i]] = strconv.Itoa(i + 1)
    }
    ranks[sorted[0]] = "Gold Medal"
    if n > 1 {
        ranks[sorted[1]] = "Silver Medal"
    }
    if n > 2 {
        ranks[sorted[2]] = "Bronze Medal"
    }
    result := make([]string, n)
    for i, s := range score {
        result[i] = ranks[s]
    }
    return result
}
