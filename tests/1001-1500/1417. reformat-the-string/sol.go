func reformat(s string) string {
    digits := []byte{}
    letters := []byte{}
    for i := 0; i < len(s); i++ {
        c := s[i]
        if c >= '0' && c <= '9' {
            digits = append(digits, c)
        } else if (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') {
            letters = append(letters, c)
        }
    }
    if abs(len(digits)-len(letters)) >= 2 {
        return ""
    }
    ans := make([]byte, len(s))
    if len(digits) > len(letters) {
        for i := 0; i < len(s); i++ {
            if i%2 == 0 {
                ans[i] = digits[i/2]
            } else {
                ans[i] = letters[i/2]
            }
        }
    } else {
        for i := 0; i < len(s); i++ {
            if i%2 == 0 {
                ans[i] = letters[i/2]
            } else {
                ans[i] = digits[i/2]
            }
        }
    }
    return string(ans)
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
