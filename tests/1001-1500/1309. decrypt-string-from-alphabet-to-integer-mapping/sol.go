func freqAlphabets(s string) string {
    decoded := make([]byte, 0)
    index := 0
    for index < len(s) {
        if index + 2 < len(s) && s[index + 2] == '#' {
            num := (s[index] - '0') * 10 + (s[index + 1] - '0')
            decoded = append(decoded, 'a' + num - 1)
            index += 3
        } else {
            num := s[index] - '0'
            decoded = append(decoded, 'a' + num - 1)
            index += 1
        }
    }
    return string(decoded)
}
