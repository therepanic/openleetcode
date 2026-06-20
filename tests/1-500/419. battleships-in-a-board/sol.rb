# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
    count = 0
    (0...board.length).each do |i|
        (0...board[0].length).each do |j|
            if board[i][j] == 'X' && (i == 0 || board[i-1][j] == '.') && (j == 0 || board[i][j-1] == '.')
                count += 1
            end
        end
    end
    count
end
