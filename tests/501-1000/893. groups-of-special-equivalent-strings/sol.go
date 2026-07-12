func numSpecialEquivGroups(words []string) int {
    seen := make(map[string]bool)
    for _, w := range words {
        var even, odd []byte
        for i := 0; i < len(w); i++ {
            if i%2 == 0 {
                even = append(even, w[i])
            } else {
                odd = append(odd, w[i])
            }
        }
        sort.Slice(even, func(i, j int) bool { return even[i] < even[j] })
        sort.Slice(odd, func(i, j int) bool { return odd[i] < odd[j] })
        key := string(even) + "," + string(odd)
        seen[key] = true
    }
    return len(seen)
}
