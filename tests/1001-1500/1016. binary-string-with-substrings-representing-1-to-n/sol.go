func queryString(s string, n int) bool {
    for num := n; num >= 1; num-- {
        target := fmt.Sprintf("%b", num)
        length := len(target)
        left := 0
        valid := false
        for right := 0; right < len(s); right++ {
            for right - left + 1 > length {
                left++
            }
            if s[left:right+1] == target {
                valid = true
                break
            }
        }
        if !valid {
            return false
        }
    }
    return true
}
