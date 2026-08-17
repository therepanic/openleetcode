func restoreString(s string, indices []int) string {
    res := make([]byte, len(indices))
    for i := 0; i < len(indices); i++ {
        res[indices[i]] = s[i]
    }
    return string(res)
}
