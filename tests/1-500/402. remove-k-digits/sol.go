func removeKdigits(num string, k int) string {
    s := []byte{}
    for i := 0; i < len(num); i++ {
        c := num[i]
        for k > 0 && len(s) > 0 && s[len(s)-1] > c {
            s = s[:len(s)-1]
            k--
        }
        s = append(s, c)
    }
    
    s = s[:len(s)-k]
    result := strings.TrimLeft(string(s), "0")
    if result == "" {
        return "0"
    }
    return result
}
