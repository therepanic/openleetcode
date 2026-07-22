func maxRepOpt1(text string) int {
    total := make(map[byte]int)
    for i := 0; i < len(text); i++ {
        total[text[i]]++
    }
    n := len(text)
    ans := 0
    
    for ch := range total {
        left := 0
        count := 0
        
        for right := 0; right < n; right++ {
            if text[right] == ch {
                count++
            }
            
            for (right - left + 1) - count > 1 {
                if text[left] == ch {
                    count--
                }
                left++
            }
            
            current := right - left + 1
            if current > total[ch] {
                current = total[ch]
            }
            if current > ans {
                ans = current
            }
        }
    }
    
    return ans
}
