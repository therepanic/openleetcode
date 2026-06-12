func reverseWords(s string) string {
    parts := strings.Fields(s)
    for left, right := 0, len(parts)-1; left < right; left, right = left+1, right-1 {
        parts[left], parts[right] = parts[right], parts[left]
    }
    return strings.Join(parts, " ")
}
