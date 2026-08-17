func maxRepeating(sequence string, word string) int {
    temp := word
    res := 0
    for strings.Contains(sequence, temp) {
        res++
        temp += word
    }
    return res
}
