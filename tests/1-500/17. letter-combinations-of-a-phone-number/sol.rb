def letter_combinations(digits)
  return [] if digits.empty?
  maps = {'2' => 'abc', '3' => 'def', '4' => 'ghi', '5' => 'jkl', '6' => 'mno', '7' => 'pqrs', '8' => 'tuv', '9' => 'wxyz'}
  res = []
  cur = ''
  letter_combinations_dfs(digits, 0, maps, cur, res)
  res
end

def letter_combinations_dfs(digits, idx, maps, cur, res)
  if idx == digits.length
    res << cur.dup
    return
  end
  maps[digits[idx]].each_char do |ch|
    cur << ch
    letter_combinations_dfs(digits, idx + 1, maps, cur, res)
    cur.chop!
  end
end
