func longestDecomposition(text string) int {
    i, j, n, count := 0, len(text)-1, 0, 0
    for i <= j {
        if text[i] == text[j] {
            if text[i:i+n+1] == text[j:j+n+1] {
                count += 2
                i += n + 1
                j -= 1
                n = 0
                continue
            }
        }
        j -= 1
        n += 1
    }
    if i == j+1 {
        return count
    }
    return count - 1
}
