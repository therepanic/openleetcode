def solve_n_queens(n)
  res = []
  board = Array.new(n) { Array.new(n, '.') }
  cols = Array.new(n, false)
  diag1 = Array.new(2 * n, false)
  diag2 = Array.new(2 * n, false)

  backtrack = lambda do |row|
    if row == n
      res << board.map { |r| r.join }
      return
    end
    (0...n).each do |col|
      d1 = row + col
      d2 = row - col + n - 1
      next if cols[col] || diag1[d1] || diag2[d2]
      cols[col] = true
      diag1[d1] = true
      diag2[d2] = true
      board[row][col] = 'Q'
      backtrack.call(row + 1)
      board[row][col] = '.'
      cols[col] = false
      diag1[d1] = false
      diag2[d2] = false
    end
  end

  backtrack.call(0)
  res
end
