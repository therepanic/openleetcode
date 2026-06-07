def generate_parenthesis(n)
  res = []
  generate_parenthesis_dfs(res, '', 0, 0, n)
  res
end

def generate_parenthesis_dfs(res, cur, open, close, n)
  if open == n && close == n
    res << cur
    return
  end
  generate_parenthesis_dfs(res, cur + '(', open + 1, close, n) if open < n
  generate_parenthesis_dfs(res, cur + ')', open, close + 1, n) if close < open
end
