func findLUSlength(a string, b string) int {
    if a == b {
        return -1
    } else {
        if len(a) > len(b) {
            return len(a)
        }
        return len(b)
    }
}
