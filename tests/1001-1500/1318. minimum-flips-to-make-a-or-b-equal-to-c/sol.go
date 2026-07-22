func minFlips(a int, b int, c int) int {
    count := 0
    for a != 0 || b != 0 || c != 0 {
        abit := a & 1
        bbit := b & 1
        cbit := c & 1

        if cbit == 0 {
            if abit == 1 {
                count++
            }
            if bbit == 1 {
                count++
            }
        } else {
            if abit == 0 && bbit == 0 {
                count++
            }
        }

        a >>= 1
        b >>= 1
        c >>= 1
    }
    return count
}
