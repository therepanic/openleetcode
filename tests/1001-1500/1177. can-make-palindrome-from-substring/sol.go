func canMakePaliQueries(s string, queries [][]int) []bool {
    n := len(s)
    prefix := make([]int, n+1)
    
    for i := 0; i < n; i++ {
        bit := 1 << (s[i] - 'a')
        prefix[i+1] = prefix[i] ^ bit
    }
    
    res := make([]bool, len(queries))
    
    for idx, query := range queries {
        left := query[0]
        right := query[1]
        ki := query[2]
        
        mask := prefix[right+1] ^ prefix[left]
        oddCount := 0
        for mask > 0 {
            oddCount += mask & 1
            mask >>= 1
        }
        
        if oddCount <= 1 || ki >= oddCount/2 {
            res[idx] = true
        } else {
            res[idx] = false
        }
    }
    
    return res
}
