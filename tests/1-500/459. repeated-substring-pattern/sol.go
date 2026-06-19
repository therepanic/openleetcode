func repeatedSubstringPattern(s string) bool {
    doubled := (s + s)[1 : 2*len(s)-1]
    return strings.Contains(doubled, s)
}
