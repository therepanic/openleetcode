func removeDuplicateLetters(s string) string {
    lastOccur := make(map[byte]int)
    for i := 0; i < len(s); i++ {
        lastOccur[s[i]] = i
    }
    
    stack := []byte{}
    visited := make(map[byte]bool)
    
    for i := 0; i < len(s); i++ {
        if visited[s[i]] {
            continue
        }
        
        for len(stack) > 0 && s[i] < stack[len(stack)-1] && i < lastOccur[stack[len(stack)-1]] {
            visited[stack[len(stack)-1]] = false
            stack = stack[:len(stack)-1]
        }
        
        visited[s[i]] = true
        stack = append(stack, s[i])
    }
    
    return string(stack)
}
