func canConstruct(s string, k int) bool {
    if len(s) < k {
        return false
    }

    charCount := make([]int, 26)
    for _, c := range s {
        charCount[c-'a']++
    }

    oddCount := 0
    for _, freq := range charCount {
        if freq%2 != 0 {
            oddCount++
        }
    }

    return oddCount <= k
}
