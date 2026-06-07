func letterCombinations(digits string) []string {
	if len(digits) == 0 {
		return []string{}
	}
	maps := []string{"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"}
	res := []string{}
	cur := []byte{}
	letterCombinationsDfs(digits, 0, maps, &cur, &res)
	return res
}

func letterCombinationsDfs(digits string, idx int, maps []string, cur *[]byte, res *[]string) {
	if idx == len(digits) {
		*res = append(*res, string(*cur))
		return
	}
	for i := 0; i < len(maps[digits[idx]-'0']); i++ {
		ch := maps[digits[idx]-'0'][i]
		*cur = append(*cur, ch)
		letterCombinationsDfs(digits, idx+1, maps, cur, res)
		*cur = (*cur)[:len(*cur)-1]
	}
}
