func fractionAddition(expression string) string {
    gcd := func(a, b int) int {
        for b != 0 {
            a, b = b, a%b
        }
        return a
    }

    type fraction struct {
        num, den int
    }
    fractions := []fraction{}
    i := 0
    for i < len(expression) {
        sign := byte('+')
        if expression[i] == '+' || expression[i] == '-' {
            sign = expression[i]
            i++
        }
        numerator := 0
        for i < len(expression) && expression[i] >= '0' && expression[i] <= '9' {
            numerator = numerator*10 + int(expression[i]-'0')
            i++
        }
        i++ // skip '/'
        denominator := 0
        for i < len(expression) && expression[i] >= '0' && expression[i] <= '9' {
            denominator = denominator*10 + int(expression[i]-'0')
            i++
        }
        if sign == '-' {
            numerator = -numerator
        }
        fractions = append(fractions, fraction{numerator, denominator})
    }

    commonDenominator := 1
    for _, f := range fractions {
        commonDenominator *= f.den / gcd(commonDenominator, f.den)
    }

    totalNumerator := 0
    for _, f := range fractions {
        totalNumerator += f.num * (commonDenominator / f.den)
    }

    abs := func(x int) int {
        if x < 0 {
            return -x
        }
        return x
    }
    gcdResult := gcd(abs(totalNumerator), commonDenominator)
    totalNumerator /= gcdResult
    commonDenominator /= gcdResult

    return fmt.Sprintf("%d/%d", totalNumerator, commonDenominator)
}
