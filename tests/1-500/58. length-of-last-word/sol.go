func lengthOfLastWord(s string) int {
    i := len(s) - 1
    for i >= 0 && s[i] == ' ' {
        i--
    }

    length := 0
    for i >= 0 && s[i] != ' ' {
        length++
        i--
    }
    return length
}
