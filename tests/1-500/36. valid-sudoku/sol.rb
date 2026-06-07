def is_valid_sudoku(board)
  rows = Array.new(9) { Array.new(9, false) }
  cols = Array.new(9) { Array.new(9, false) }
  boxes = Array.new(9) { Array.new(9, false) }

  9.times do |i|
    9.times do |j|
      next if board[i][j] == '.'
      num = board[i][j].ord - '1'.ord
      box = (i / 3) * 3 + (j / 3)
      return false if rows[i][num] || cols[j][num] || boxes[box][num]
      rows[i][num] = cols[j][num] = boxes[box][num] = true
    end
  end

  true
end
