func maximumBinaryString(binary string) string {
    n := len(binary)
    z := strings.Count(binary, "0")
    
    if z < 2 {
        return binary
    }
    
    firstZero := strings.Index(binary, "0")
    p := firstZero + z - 1
    
    return strings.Repeat("1", p) + "0" + strings.Repeat("1", n - p - 1)
}
