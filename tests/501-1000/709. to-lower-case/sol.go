func toLowerCase(s string) string {
    result := ""
    for _, ch := range s {
        if ch >= 65 && ch <= 90 {
            result += string(ch + 32)
        } else {
            result += string(ch)
        }
    }
    return result
}
