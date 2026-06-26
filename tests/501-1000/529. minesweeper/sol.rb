# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
    directions = [[-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]
    rows, cols = board.length, board[0].length
    r, c = click

    if board[r][c] == 'M'
        board[r][c] = 'X'
        return board
    end

    count_mines = lambda do |r, c|
        count = 0
        directions.each do |dr, dc|
            nr, nc = r + dr, c + dc
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == 'M'
                count += 1
            end
        end
        count
    end

    reveal = lambda do |r, c|
        if !(r >= 0 && r < rows && c >= 0 && c < cols) || board[r][c] != 'E'
            return
        end
        mines = count_mines.call(r, c)
        if mines > 0
            board[r][c] = mines.to_s
        else
            board[r][c] = 'B'
            directions.each do |dr, dc|
                reveal.call(r + dr, c + dc)
            end
        end
    end

    reveal.call(r, c)
    board
end
