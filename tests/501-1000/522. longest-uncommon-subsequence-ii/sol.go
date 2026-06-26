import (
	"sort"
)

func findLUSlength(strs []string) int {
    sort.Slice(strs, func(i, j int) bool {
        return len(strs[i]) > len(strs[j])
    })

    isSubsequence := func(s, t string) bool {
        i := 0
        for _, c := range t {
            if i < len(s) && s[i] == byte(c) {
                i++
            }
        }
        return i == len(s)
    }

    for i, s := range strs {
        unique := true
        for j, t := range strs {
            if i == j {
                continue
            }
            if isSubsequence(s, t) {
                unique = false
                break
            }
        }
        if unique {
            return len(s)
        }
    }

    return -1
}
