func makeFancyString(s string) string {
    if len(s) == 0 {
        return ""
    }
    result := []byte{s[0]}
    last := s[0]
    count := 1

    for i := 1; i < len(s); i++ {
        if s[i] != last {
            last = s[i]
            count = 0
        }

        count++
        if count > 2 {
            continue
        }

        result = append(result, s[i])
    }

    return string(result)
}
