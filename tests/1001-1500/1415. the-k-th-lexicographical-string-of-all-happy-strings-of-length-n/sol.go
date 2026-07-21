func getHappyString(n int, k int) string {
    total := 3 * (1 << (n - 1))
    if k > total {
        return ""
    }
    
    k--
    result := make([]byte, 0, n)
    var last byte = 0
    
    for pos := 0; pos < n; pos++ {
        branch := 1 << (n - pos - 1)
        choices := []byte{}
        for _, c := range []byte{'a', 'b', 'c'} {
            if c != last {
                choices = append(choices, c)
            }
        }
        
        idx := k / branch
        result = append(result, choices[idx])
        
        last = choices[idx]
        k %= branch
    }
    
    return string(result)
}
