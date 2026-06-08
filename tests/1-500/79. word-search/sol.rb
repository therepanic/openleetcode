def exist(board, word)
  rows = board.length
  cols = board[0].length
  dfs = nil
  dfs = lambda do |r, c, idx|
    return true if idx == word.length
    return false if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != word[idx]
    saved = board[r][c]
    board[r][c] = '#'
    found = dfs.call(r + 1, c, idx + 1) || dfs.call(r - 1, c, idx + 1) || dfs.call(r, c + 1, idx + 1) || dfs.call(r, c - 1, idx + 1)
    board[r][c] = saved
    found
  end
  (0...rows).each do |r|
    (0...cols).each do |c|
      return true if board[r][c] == word[0] && dfs.call(r, c, 0)
    end
  end
  false
end
