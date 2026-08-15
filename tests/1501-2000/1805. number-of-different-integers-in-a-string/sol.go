func numDifferentIntegers(word string) int {
    i := 0
    n := len(word)
    st := make(map[string]bool)
    for i < n {
        for i < n && (word[i] >= 'a' && word[i] <= 'z' || word[i] >= 'A' && word[i] <= 'Z') {
            i++
        }
        tempInt := ""
        for i < n && word[i] >= '0' && word[i] <= '9' {
            tempInt += string(word[i])
            i++
        }
        j := 0
        for j+1 < len(tempInt) && tempInt[j] == '0' {
            j++
        }
        k := tempInt[j:]
        if k != "" {
            st[k] = true
        }
    }
    return len(st)
}
