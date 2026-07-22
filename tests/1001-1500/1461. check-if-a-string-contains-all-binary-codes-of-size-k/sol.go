func hasAllCodes(s string, k int) bool {
    req := 1 << k
    seen := make([]bool, req)
    mask := req - 1
    h := 0

    for i := 0; i < len(s); i++ {
        h = ((h << 1) & mask) | (int(s[i]) & 1)

        if i >= k-1 && !seen[h] {
            seen[h] = true
            req--
            if req == 0 {
                return true
            }
        }
    }

    return false
}
