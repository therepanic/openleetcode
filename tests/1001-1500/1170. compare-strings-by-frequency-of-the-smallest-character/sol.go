func numSmallerByFrequency(queries []string, words []string) []int {
    f := func(s string) int {
        minChar := byte('z')
        count := 0
        for i := 0; i < len(s); i++ {
            if s[i] < minChar {
                minChar = s[i]
                count = 1
            } else if s[i] == minChar {
                count++
            }
        }
        return count
    }
    
    buckets := make([]int, 12)
    for _, w := range words {
        buckets[f(w)]++
    }
    for i := 9; i >= 0; i-- {
        buckets[i] += buckets[i+1]
    }
    
    result := make([]int, len(queries))
    for i, q := range queries {
        result[i] = buckets[f(q)+1]
    }
    return result
}
