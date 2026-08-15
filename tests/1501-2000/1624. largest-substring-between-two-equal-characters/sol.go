func maxLengthBetweenEqualCharacters(s string) int {
    firstPos := make([]int, 26)
    lastPos := make([]int, 26)
    for i := range firstPos {
        firstPos[i] = -1
        lastPos[i] = -1
    }
    n := len(s)
    for i := 0; i < n; i++ {
        idx := int(s[i] - 'a')
        if firstPos[idx] == -1 {
            firstPos[idx] = i
        }
    }
    for i := n - 1; i >= 0; i-- {
        idx := int(s[i] - 'a')
        if lastPos[idx] == -1 {
            lastPos[idx] = i
        }
    }
    maxLen := -1
    for i := 0; i < 26; i++ {
        if firstPos[i] != -1 && lastPos[i] != -1 {
            diff := lastPos[i] - firstPos[i] - 1
            if diff > maxLen {
                maxLen = diff
            }
        }
    }
    return maxLen
}
