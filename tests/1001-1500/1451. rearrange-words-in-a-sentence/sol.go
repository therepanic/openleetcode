func arrangeWords(text string) string {
    s := strings.Split(text, " ")
    sort.SliceStable(s, func(i, j int) bool {
        return len(s[i]) < len(s[j])
    })
    for i := range s {
        s[i] = strings.ToLower(s[i])
    }
    if len(s) > 0 {
        s[0] = strings.ToUpper(s[0][:1]) + s[0][1:]
    }
    return strings.Join(s, " ")
}
