func kSimilarity(s1 string, s2 string) int {
    queue := []string{s1}
    seen := make(map[string]bool)
    answ := 0
    
    for len(queue) > 0 {
        size := len(queue)
        for k := 0; k < size; k++ {
            str := queue[0]
            queue = queue[1:]
            if str == s2 {
                return answ
            }
            
            i := 0
            for str[i] == s2[i] {
                i++
            }
            
            for j := i + 1; j < len(str); j++ {
                if str[i] == s2[j] && s2[j] != s1[j] {
                    newStr := str[:i] + string(str[j]) + str[i+1:j] + string(str[i]) + str[j+1:]
                    if !seen[newStr] {
                        seen[newStr] = true
                        queue = append(queue, newStr)
                    }
                }
            }
        }
        answ++
    }
    return answ
}
