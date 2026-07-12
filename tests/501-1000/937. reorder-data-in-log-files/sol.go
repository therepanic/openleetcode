func reorderLogFiles(logs []string) []string {
    sort.SliceStable(logs, func(i, j int) bool {
        s1 := logs[i]
        s2 := logs[j]
        idx1 := strings.Index(s1, " ")
        idx2 := strings.Index(s2, " ")
        ident1, rest1 := s1[:idx1], s1[idx1+1:]
        ident2, rest2 := s2[:idx2], s2[idx2+1:]
        isDigit1 := rest1[0] >= '0' && rest1[0] <= '9'
        isDigit2 := rest2[0] >= '0' && rest2[0] <= '9'
        if !isDigit1 && !isDigit2 {
            if rest1 != rest2 {
                return rest1 < rest2
            }
            return ident1 < ident2
        }
        if isDigit1 && isDigit2 {
            return false
        }
        return !isDigit1
    })
    return logs
}
