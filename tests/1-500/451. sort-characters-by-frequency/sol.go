func frequencySort(s string) string {
    freq := make(map[rune]int)
    for _, c := range s {
        freq[c]++
    }
    type pair struct {
        char rune
        count int
    }
    pairs := make([]pair, 0, len(freq))
    for k, v := range freq {
        pairs = append(pairs, pair{k, v})
    }
    sort.Slice(pairs, func(i, j int) bool {
        return pairs[i].count > pairs[j].count
    })
    var result strings.Builder
    for _, p := range pairs {
        result.WriteString(strings.Repeat(string(p.char), p.count))
    }
    return result.String()
}
