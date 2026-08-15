func replaceDigits(s string) string {
    chars := []byte(s)
    for i := 1; i < len(chars); i += 2 {
        ch := chars[i-1]
        digit := chars[i] - '0'
        chars[i] = ch + digit
    }
    return string(chars)
}
