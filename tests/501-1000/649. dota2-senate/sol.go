func predictPartyVictory(senate string) string {
    r := make([]int, 0)
    d := make([]int, 0)
    n := len(senate)
    
    for i := 0; i < n; i++ {
        if senate[i] == 'R' {
            r = append(r, i)
        } else {
            d = append(d, i)
        }
    }
    
    for len(r) > 0 && len(d) > 0 {
        rIdx := r[0]
        dIdx := d[0]
        r = r[1:]
        d = d[1:]
        
        if rIdx < dIdx {
            r = append(r, rIdx+n)
        } else {
            d = append(d, dIdx+n)
        }
    }
    
    if len(r) > 0 {
        return "Radiant"
    }
    return "Dire"
}
