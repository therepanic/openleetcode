func pushDominoes(dominoes string) string {
    s := "L" + dominoes + "R"
    var res []byte
    prev := 0
    for curr := 1; curr < len(s); curr++ {
        if s[curr] == '.' {
            continue
        }
        span := curr - prev - 1
        if prev > 0 {
            res = append(res, s[prev])
        }
        if s[prev] == s[curr] {
            for i := 0; i < span; i++ {
                res = append(res, s[prev])
            }
        } else if s[prev] == 'L' && s[curr] == 'R' {
            for i := 0; i < span; i++ {
                res = append(res, '.')
            }
        } else {
            for i := 0; i < span/2; i++ {
                res = append(res, 'R')
            }
            if span%2 == 1 {
                res = append(res, '.')
            }
            for i := 0; i < span/2; i++ {
                res = append(res, 'L')
            }
        }
        prev = curr
    }
    return string(res)
}
