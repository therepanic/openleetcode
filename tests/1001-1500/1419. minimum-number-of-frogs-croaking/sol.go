func minNumberOfFrogs(croakOfFrogs string) int {
    maxi := 0
    curr := 0
    c, r, o, a, k := 0, 0, 0, 0, 0
    for _, ch := range croakOfFrogs {
        if ch == 'c' {
            c++
            curr++
        } else if ch == 'r' {
            r++
        } else if ch == 'o' {
            o++
        } else if ch == 'a' {
            a++
        } else if ch == 'k' {
            k++
            curr--
        }
        if curr > maxi {
            maxi = curr
        }
        if c < r || r < o || o < a || a < k {
            return -1
        }
    }
    if curr == 0 && c == r && r == o && o == a && a == k {
        return maxi
    } else {
        return -1
    }
}
