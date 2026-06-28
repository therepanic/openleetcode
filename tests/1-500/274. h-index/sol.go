func hIndex(citations []int) int {
    sort.Slice(citations, func(i, j int) bool {
        return citations[i] > citations[j]
    })
    count := 0
    for i := 0; i < len(citations); i++ {
        if citations[i] >= i+1 {
            count = i + 1
        } else {
            break
        }
    }
    return count
}
