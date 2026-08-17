func maximumGain(s string, x int, y int) int {
    score := 0
    ch1, ch2 := byte('a'), byte('b')
    cnt1, cnt2 := 0, 0

    if x < y {
        x, y = y, x
        ch1, ch2 = 'b', 'a'
    }

    for i := 0; i < len(s); i++ {
        ch := s[i]
        if ch == ch1 {
            cnt1++
        } else if ch == ch2 {
            if cnt1 > 0 {
                cnt1--
                score += x
            } else {
                cnt2++
            }
        } else {
            score += min(cnt1, cnt2) * y
            cnt1, cnt2 = 0, 0
        }
    }

    if cnt1 != 0 {
        score += min(cnt1, cnt2) * y
    }

    return score
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
