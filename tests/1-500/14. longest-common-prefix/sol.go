import "sort"

func longestCommonPrefix(strs []string) string {
	if len(strs) == 0 {
		return ""
	}
	sort.Strings(strs)
	first := strs[0]
	last := strs[len(strs)-1]
	i := 0
	for i < len(first) && i < len(last) && first[i] == last[i] {
		i++
	}
	return first[:i]
}
