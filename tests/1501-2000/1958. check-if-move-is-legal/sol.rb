# @param {Character[][]} board
# @param {Integer} r_move
# @param {Integer} c_move
# @param {Character} color
# @return {Boolean}
def check_move(board, r_move, c_move, color)
    opposite = color == 'B' ? 'W' : 'B'
    dirs = [[-1,-1],[-1,0],[-1,1],
            [0,-1],        [0,1],
            [1,-1],[1,0],[1,1]]

    dirs.each do |dr, dc|
        r = r_move + dr
        c = c_move + dc
        cnt = 0

        while r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite
            r += dr
            c += dc
            cnt += 1
        end

        if cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color
            return true
        end
    end

    false
end
