func simplifiedFractions(n int) []string {
    fractions := make([]string, 0)
    for numerator := 1; numerator < n; numerator++ {
        for denominator := numerator + 1; denominator <= n; denominator++ {
            if gcd(numerator, denominator) == 1 {
                fractions = append(fractions, fmt.Sprintf("%d/%d", numerator, denominator))
            }
        }
    }
    return fractions
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
