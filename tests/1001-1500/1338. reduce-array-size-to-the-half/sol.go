func minSetSize(arr []int) int {
    freq := make(map[int]int)
    for _, num := range arr {
        freq[num]++
    }
    
    counts := make([]int, 0, len(freq))
    for _, v := range freq {
        counts = append(counts, v)
    }
    sort.Slice(counts, func(i, j int) bool {
        return counts[i] > counts[j]
    })
    
    sumRemoved := 0
    minSetSize := 0
    for _, count := range counts {
        sumRemoved += count
        minSetSize++
        if sumRemoved >= len(arr)/2 {
            return minSetSize
        }
    }
    return minSetSize
}
