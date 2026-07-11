func lemonadeChange(bills []int) bool {
    f, t := 0, 0
    for _, bill := range bills {
        if bill == 5 {
            f++
        } else if bill == 10 {
            if f >= 1 {
                f--
                t++
            } else {
                return false
            }
        } else {
            if f >= 1 && t >= 1 {
                t--
                f--
            } else if f >= 3 {
                f -= 3
            } else {
                return false
            }
        }
    }
    return true
}
