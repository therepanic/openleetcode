func maxProduct(s string) int {
    n := len(s)
    type palin struct {
        mask int
        len  int
    }
    palins := []palin{}
    
    for mask := 1; mask < (1 << n); mask++ {
        var sb []byte
        for i := 0; i < n; i++ {
            if ((mask >> i) & 1) == 1 {
                sb = append(sb, s[i])
            }
        }
        // check palindrome
        valid := true
        for i, j := 0, len(sb)-1; i < j; i, j = i+1, j-1 {
            if sb[i] != sb[j] {
                valid = false
                break
            }
        }
        if valid {
            count := 0
            for i := 0; i < n; i++ {
                if ((mask >> i) & 1) == 1 {
                    count++
                }
            }
            palins = append(palins, palin{mask, count})
        }
    }
    
    maxProd := 0
    for i := 0; i < len(palins); i++ {
        for j := i + 1; j < len(palins); j++ {
            if (palins[i].mask & palins[j].mask) == 0 {
                prod := palins[i].len * palins[j].len
                if prod > maxProd {
                    maxProd = prod
                }
            }
        }
    }
    
    return maxProd
}
