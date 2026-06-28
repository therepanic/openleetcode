# @param {String[]} board
# @return {Boolean}
def valid_tic_tac_toe(board)
  count_x = board.sum { |row| row.count('X') }
  count_o = board.sum { |row| row.count('O') }
  
  return false if count_o > count_x || count_x > count_o + 1
  
  is_winner = lambda do |player|
    rows = (0..2).any? { |r| (0..2).all? { |c| board[r][c] == player } }
    cols = (0..2).any? { |c| (0..2).all? { |r| board[r][c] == player } }
    diag1 = board[0][0] == player && board[1][1] == player && board[2][2] == player
    diag2 = board[0][2] == player && board[1][1] == player && board[2][0] == player
    rows || cols || diag1 || diag2
  end
  
  x_wins = is_winner.call('X')
  o_wins = is_winner.call('O')
  
  return false if x_wins && o_wins
  return false if x_wins && count_x != count_o + 1
  return false if o_wins && count_x != count_o
  
  true
end
