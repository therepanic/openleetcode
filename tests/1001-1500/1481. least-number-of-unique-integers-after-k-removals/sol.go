func findLeastNumOfUniqueInts(arr []int, k int) int {
    counts := make(map[int]int)
    for _, num := range arr {
        counts[num]++
    }
    remaining := len(counts)
    var freqs []int
    for _, freq := range counts {
        freqs = append(freqs, freq)
    }
    sort.Ints(freqs)
    for _, count := range freqs {
        if k < count {
            break
        }
        k -= count
        remaining--
    }
    return remaining
}
