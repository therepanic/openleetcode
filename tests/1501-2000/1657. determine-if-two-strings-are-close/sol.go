func closeStrings(word1 string, word2 string) bool {
    if len(word1) != len(word2) {
        return false
    }
    set1 := map[rune]struct{}{}
    set2 := map[rune]struct{}{}
    for _, c := range word1 {
        set1[c] = struct{}{}
    }
    for _, c := range word2 {
        set2[c] = struct{}{}
    }
    if len(set1) != len(set2) {
        return false
    }
    for k := range set1 {
        if _, ok := set2[k]; !ok {
            return false
        }
    }
    dct := map[int]int{}
    for x := range set1 {
        n1 := countChar(word1, x)
        n2 := countChar(word2, x)
        dct[n1]++
        dct[n2]--
    }
    for _, v := range dct {
        if v != 0 {
            return false
        }
    }
    return true
}

func countChar(s string, c rune) int {
    count := 0
    for _, r := range s {
        if r == c {
            count++
        }
    }
    return count
}
