func generateParenthesis(n int) []string {
	res := []string{}
	cur := []byte{}
	generateParenthesisDfs(0, 0, n, &cur, &res)
	return res
}

func generateParenthesisDfs(open, close, n int, cur *[]byte, res *[]string) {
	if open == n && close == n {
		*res = append(*res, string(*cur))
		return
	}
	if open < n {
		*cur = append(*cur, '(')
		generateParenthesisDfs(open+1, close, n, cur, res)
		*cur = (*cur)[:len(*cur)-1]
	}
	if close < open {
		*cur = append(*cur, ')')
		generateParenthesisDfs(open, close+1, n, cur, res)
		*cur = (*cur)[:len(*cur)-1]
	}
}
