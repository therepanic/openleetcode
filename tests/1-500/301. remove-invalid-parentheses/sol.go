func removeInvalidParentheses(s string) []string {
    isValid := func(str string) bool {
        ctr := 0
        for _, ch := range str {
            if ch == '(' {
                ctr++
            } else if ch == ')' {
                if ctr == 0 {
                    return false
                }
                ctr--
            }
        }
        return ctr == 0
    }
    
    level := map[string]bool{s: true}
    for {
        var valid []string
        for str := range level {
            if isValid(str) {
                valid = append(valid, str)
            }
        }
        if len(valid) > 0 {
            return valid
        }
        nextLevel := make(map[string]bool)
        for str := range level {
            for i := 0; i < len(str); i++ {
                nextLevel[str[:i] + str[i+1:]] = true
            }
        }
        level = nextLevel
    }
}
