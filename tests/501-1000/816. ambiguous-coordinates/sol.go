func ambiguousCoordinates(s string) []string {
    s = s[1 : len(s)-1]
    finalResults := make([]string, 0)
    
    getValidNumbers := func(numStr string) []string {
        res := make([]string, 0)
        
        for i := 1; i <= len(numStr); i++ {
            left := numStr[:i]
            right := numStr[i:]
            
            if (len(left) > 1 && left[0] == '0') || (len(right) > 0 && right[len(right)-1] == '0') {
                continue
            }
            
            if len(right) == 0 {
                res = append(res, left)
            } else {
                res = append(res, left + "." + right)
            }
        }
        
        return res
    }
    
    for i := 1; i < len(s); i++ {
        xOptions := getValidNumbers(s[:i])
        yOptions := getValidNumbers(s[i:])
        
        for _, x := range xOptions {
            for _, y := range yOptions {
                finalResults = append(finalResults, "(" + x + ", " + y + ")")
            }
        }
    }
    
    return finalResults
}
