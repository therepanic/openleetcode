func smallestSubsequence(s string) string {
    fqMap := make(map[rune]int)
    stack := []rune{}
    visited := make(map[rune]bool)
    for _, ch := range s {
        fqMap[ch]++
    }
    for _, ch := range s {
        fqMap[ch]--
        if visited[ch] {
            continue
        }
        for len(stack) > 0 && ch < stack[len(stack)-1] && fqMap[stack[len(stack)-1]] > 0 {
            visited[stack[len(stack)-1]] = false
            stack = stack[:len(stack)-1]
        }
        visited[ch] = true
        stack = append(stack, ch)
    }
    return string(stack)
}
