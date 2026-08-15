func minimumDeletions(s string) int {
    res := 0
    count := 0
    for _, ch := range s {
        if ch == 'b' {
            count++
        } else if count > 0 {
            res++
            count--
        }
    }
    return res
}
