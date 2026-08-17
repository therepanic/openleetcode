func canConvertString(s string, t string, k int) bool {
    if len(s) != len(t) {
        return false
    }
    shiftCount := make([]int, 26)
    for i := 0; i < len(s); i++ {
        if s[i] == t[i] {
            continue
        }
        diff := int(t[i]-s[i]+26) % 26
        shiftCount[diff]++
        if diff+26*(shiftCount[diff]-1) > k {
            return false
        }
    }
    return true
}
