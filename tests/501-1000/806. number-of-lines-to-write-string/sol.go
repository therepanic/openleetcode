func numberOfLines(widths []int, s string) []int {
    lines := 1
    current := 0
    for _, c := range s {
        w := widths[c - 'a']
        if current + w > 100 {
            lines++
            current = w
        } else {
            current += w
        }
    }
    return []int{lines, current}
}
