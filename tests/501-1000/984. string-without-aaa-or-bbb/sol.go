func strWithout3a3b(a int, b int) string {
    res := ""
    prevA := 0
    prevB := 0
    
    for a > 0 || b > 0 {
        if prevA == 2 && b > 0 {
            res += "b"
            b--
            prevB++
            prevA = 0
        } else if prevB == 2 && a > 0 {
            res += "a"
            a--
            prevA++
            prevB = 0
        } else if a > b && a > 0 {
            res += "a"
            a--
            prevA++
        } else if b > 0 {
            res += "b"
            b--
            prevB++
        }
    }
    return res
}
