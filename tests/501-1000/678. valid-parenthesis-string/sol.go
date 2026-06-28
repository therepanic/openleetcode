func checkValidString(s string) bool {
    low, high := 0, 0
    for _, char := range s {
        if char == '(' {
            low++
            high++
        } else if char == ')' {
            if low > 0 {
                low--
            }
            high--
        } else {
            if low > 0 {
                low--
            }
            high++
        }
        if high < 0 {
            return false
        }
    }
    return low == 0
}
