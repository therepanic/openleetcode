import "strconv"

func diffWaysToCompute(expression string) []int {
    if isDigit(expression) {
        num, _ := strconv.Atoi(expression)
        return []int{num}
    }
    
    results := []int{}
    
    for i, char := range expression {
        if char == '+' || char == '-' || char == '*' {
            leftResults := diffWaysToCompute(expression[:i])
            rightResults := diffWaysToCompute(expression[i+1:])
            
            for _, left := range leftResults {
                for _, right := range rightResults {
                    if char == '+' {
                        results = append(results, left+right)
                    } else if char == '-' {
                        results = append(results, left-right)
                    } else if char == '*' {
                        results = append(results, left*right)
                    }
                }
            }
        }
    }
    
    return results
}

func isDigit(s string) bool {
    for _, c := range s {
        if c < '0' || c > '9' {
            return false
        }
    }
    return true
}
