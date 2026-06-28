func solveEquation(equation string) string {
    parts := strings.Split(equation, "=")
    
    parseSide := func(side string) (int, int) {
        coeff := 0
        constant := 0
        num := ""
        sign := 1
        side += "+"
        
        for _, ch := range side {
            if ch == '+' || ch == '-' {
                if len(num) > 0 {
                    val, _ := strconv.Atoi(num)
                    constant += sign * val
                    num = ""
                }
                if ch == '+' {
                    sign = 1
                } else {
                    sign = -1
                }
            } else if unicode.IsDigit(ch) {
                num += string(ch)
            } else if ch == 'x' {
                if len(num) > 0 {
                    val, _ := strconv.Atoi(num)
                    coeff += sign * val
                } else {
                    coeff += sign * 1
                }
                num = ""
            }
        }
        return coeff, constant
    }
    
    leftCoeff, leftConst := parseSide(parts[0])
    rightCoeff, rightConst := parseSide(parts[1])
    
    coeff := leftCoeff - rightCoeff
    constant := rightConst - leftConst
    
    if coeff == 0 {
        if constant != 0 {
            return "No solution"
        }
        return "Infinite solutions"
    }
    return "x=" + strconv.Itoa(constant / coeff)
}
