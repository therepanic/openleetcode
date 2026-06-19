func countSegments(s string) int {
    c := 0
    for i := 0; i < len(s); i++ {
        if s[i] != ' ' && (i == 0 || s[i-1] == ' ') {
            c++
        }
    }
    return c
}
