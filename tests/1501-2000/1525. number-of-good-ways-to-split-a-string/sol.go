func numSplits(s string) int {
    n := len(s)
    counter := 0
    distinct_left := make(map[rune]int)
    distinct_right := make(map[rune]int)

    for _, c := range s {
        distinct_right[c]++
    }
    for i := 0; i < n-1; i++ {
        c := rune(s[i])
        distinct_left[c]++
        distinct_right[c]--
        if distinct_right[c] == 0 {
            delete(distinct_right, c)
        }
        if len(distinct_left) == len(distinct_right) {
            counter++
        }
    }

    return counter
}
