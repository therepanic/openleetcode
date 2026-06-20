func addStrings(num1 string, num2 string) string {
    result := make([]byte, 0)
    carry := 0
    i, j := len(num1)-1, len(num2)-1
    
    for i >= 0 || j >= 0 || carry > 0 {
        digit1 := 0
        if i >= 0 {
            digit1 = int(num1[i] - '0')
        }
        digit2 := 0
        if j >= 0 {
            digit2 = int(num2[j] - '0')
        }
        
        total := digit1 + digit2 + carry
        carry = total / 10
        result = append(result, byte(total%10 + '0'))
        
        i--
        j--
    }
    
    for left, right := 0, len(result)-1; left < right; left, right = left+1, right-1 {
        result[left], result[right] = result[right], result[left]
    }
    
    return string(result)
}
