func backspaceCompare(s string, t string) bool {
    getNextValidCharIndex := func(str string, end int) int {
        backspaceCount := 0
        for end >= 0 {
            if str[end] == '#' {
                backspaceCount++
            } else if backspaceCount > 0 {
                backspaceCount--
            } else {
                break
            }
            end--
        }
        return end
    }

    ps := len(s) - 1
    pt := len(t) - 1

    for ps >= 0 || pt >= 0 {
        ps = getNextValidCharIndex(s, ps)
        pt = getNextValidCharIndex(t, pt)

        if ps < 0 && pt < 0 {
            return true
        }
        if ps < 0 || pt < 0 {
            return false
        } else if s[ps] != t[pt] {
            return false
        }

        ps--
        pt--
    }

    return true
}
