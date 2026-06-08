func myPow(x float64, n int) float64 {
    exp := int64(n)
    if exp < 0 {
        x = 1.0 / x
        exp = -exp
    }

    ans := 1.0
    for exp > 0 {
        if exp%2 == 1 {
            ans *= x
        }
        x *= x
        exp /= 2
    }
    return ans
}
