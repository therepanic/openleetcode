func atMostNGivenDigitSet(digits []string, n int) int {
    d := len(digits)
    s := strconv.Itoa(n)
    k := len(s)
    
    ans := 0
    if d == 1 {
        ans = k - 1
    } else {
        ans = (int(math.Pow(float64(d), float64(k))) - d) / (d - 1)
    }
    
    for i := 0; i < k; i++ {
        ch := s[i]
        cnt := 0
        for _, digit := range digits {
            if digit[0] < ch {
                cnt++
            }
        }
        ans += cnt * int(math.Pow(float64(d), float64(k-i-1)))
        
        found := false
        for _, digit := range digits {
            if digit[0] == ch {
                found = true
                break
            }
        }
        if !found {
            break
        }
        if i == k-1 {
            ans++
        }
    }
    
    return ans
}
