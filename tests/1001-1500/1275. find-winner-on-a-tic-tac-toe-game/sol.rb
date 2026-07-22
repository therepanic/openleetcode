# @param {Integer[][]} moves
# @return {String}
def tictactoe(moves)
    board = Array.new(3) { Array.new(3, "") }
    is_a = true
    moves.each do |r, c|
        board[r][c] = is_a ? "X" : "O"
        is_a = !is_a
    end

    (0..2).each do |i|
        if board[i][0] != "" && board[i][0] == board[i][1] && board[i][1] == board[i][2]
            return board[i][0] == "X" ? "A" : "B"
        end
        if board[0][i] != "" && board[0][i] == board[1][i] && board[1][i] == board[2][i]
            return board[0][i] == "X" ? "A" : "B"
        end
    end

    if board[1][1] != "" && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0]))
        return board[1][1] == "X" ? "A" : "B"
    end

    moves.length == 9 ? "Draw" : "Pending"
end
