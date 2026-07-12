func isValid(s string) bool {
    if s == "abc" {
        return true
    }
    if s[0] != 'a' || s[len(s)-1] != 'c' {
        return false
    }
    l := []rune(s)
    for j := 0; j < len(l); j++ {
        for i := 0; i <= len(l)-3; i++ {
            if len(l) == 3 && l[0] == 'a' && l[1] == 'b' && l[2] == 'c' {
                return true
            }
            if i+2 <= len(l)-1 {
                if l[i] == 'a' && l[i+1] == 'b' && l[i+2] == 'c' {
                    l = append(l[:i], l[i+3:]...)
                    i = -1
                    continue
                }
            }
        }
    }
    if len(l) == 0 {
        return true
    }
    return false
}
