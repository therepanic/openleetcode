func areAlmostEqual(s1 string, s2 string) bool {
    i := -1
    j := -1
    cnt := 0
    for k := 0; k < len(s1); k++ {
        if s1[k] != s2[k] {
            cnt++
            if i == -1 {
                i = k
            } else if j == -1 {
                j = k
            }
        }
    }
    
    if cnt == 0 {
        return true
    }
    if cnt == 2 && s1[i] == s2[j] && s1[j] == s2[i] {
        return true
    }
    return false
}
