func checkZeroOnes(s string) bool {
    max1 := 0
    max0 := 0
    one := 0
    zero := 0
    
    for _, ch := range s {
        if ch == '1' {
            one++
            zero = 0
            if one > max1 {
                max1 = one
            }
        } else {
            zero++
            one = 0
            if zero > max0 {
                max0 = zero
            }
        }
    }
    
    return max1 > max0
}
