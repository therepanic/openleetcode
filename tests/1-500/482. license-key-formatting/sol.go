func licenseKeyFormatting(s string, k int) string {
    s = strings.ReplaceAll(s, "-", "")
    s = strings.ToUpper(s)
    result := []string{}
    n := len(s)
    for i := n; i > 0; i -= k {
        start := 0
        if i - k > 0 {
            start = i - k
        }
        result = append([]string{s[start:i]}, result...)
    }
    return strings.Join(result, "-")
}
