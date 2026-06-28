func complexNumberMultiply(num1 string, num2 string) string {
    parseComplex := func(s string) (int, int) {
        parts := strings.Split(s, "+")
        real, _ := strconv.Atoi(parts[0])
        imag, _ := strconv.Atoi(parts[1][:len(parts[1])-1])
        return real, imag
    }
    
    a, b := parseComplex(num1)
    c, d := parseComplex(num2)
    realPart := a*c - b*d
    imagPart := a*d + b*c
    return strconv.Itoa(realPart) + "+" + strconv.Itoa(imagPart) + "i"
}
