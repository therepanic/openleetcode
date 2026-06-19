func getMaxRepetitions(s1 string, n1 int, s2 string, n2 int) int {
    m := len(s1)
    n := len(s2)
    
    if int64(m)*int64(n1) < int64(n)*int64(n2) {
        return 0
    }
    
    j := 0
    cnt := 0
    k := 0
    
    seen := make(map[int][2]int)
    
    for k < n1 {
        for _, ch := range s1 {
            if byte(ch) == s2[j] {
                j++
                if j == n {
                    cnt++
                    j = 0
                }
            }
        }
        
        k++
        
        if prev, ok := seen[j]; ok {
            prevCnt := prev[0]
            prevK := prev[1]
            
            periodK := k - prevK
            periodCnt := cnt - prevCnt
            
            if periodCnt == 0 {
                break
            }
            
            remaining := n1 - k
            cycles := remaining / periodK
            
            cnt += cycles * periodCnt
            k += cycles * periodK
        } else {
            seen[j] = [2]int{cnt, k}
        }
    }
    
    return cnt / n2
}
