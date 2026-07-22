func lastSubstring(s string) string {
    i, j, k := 0, 1, 0
    n := len(s)
    for j+k < n {
        if s[i+k] == s[j+k] {
            k++
            continue
        } else if s[i+k] > s[j+k] {
            j = j + k + 1
        } else {
            i = max(i+k+1, j)
            j = i + 1
        }
        k = 0
    }
    return s[i:]
}
