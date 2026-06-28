func makeLargestSpecial(s string) string {
    count := 0
    i := 0
    var res []string
    
    for j := 0; j < len(s); j++ {
        if s[j] == '1' {
            count++
        } else {
            count--
        }
        
        if count == 0 {
            res = append(res, "1" + makeLargestSpecial(s[i+1:j]) + "0")
            i = j + 1
        }
    }
    
    sort.Slice(res, func(a, b int) bool {
        return res[a] > res[b]
    })
    
    return strings.Join(res, "")
}
