func minDeletions(s string) int {
    count := make([]int, 26)
    for _, c := range s {
        count[c-'a']++
    }
    freqs := []int{}
    for _, f := range count {
        if f > 0 {
            freqs = append(freqs, f)
        }
    }
    sort.Sort(sort.Reverse(sort.IntSlice(freqs)))
    deletes := 0
    for idx := 1; idx < len(freqs); idx++ {
        if freqs[idx] >= freqs[idx-1] {
            target := max(0, freqs[idx-1]-1)
            deletes += (freqs[idx] - target)
            freqs[idx] = target
        }
    }
    return deletes
}
