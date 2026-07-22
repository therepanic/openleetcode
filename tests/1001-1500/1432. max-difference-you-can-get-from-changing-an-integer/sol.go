func maxDiff(num int) int {
    numStr := strconv.Itoa(num)
    uniqueDigits := make(map[rune]bool)
    for _, ch := range numStr {
        uniqueDigits[ch] = true
    }
    maxVal := num
    minVal := num
    
    for digit := range uniqueDigits {
        for newDigit := '0'; newDigit <= '9'; newDigit++ {
            if rune(numStr[0]) == digit && newDigit == '0' {
                continue
            }
            newNumStr := strings.ReplaceAll(numStr, string(digit), string(newDigit))
            newNum, _ := strconv.Atoi(newNumStr)
            if newNum > maxVal {
                maxVal = newNum
            }
            if newNum < minVal {
                minVal = newNum
            }
        }
    }
    
    return maxVal - minVal
}
