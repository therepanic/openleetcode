# @param {Integer[][]} queens
# @param {Integer[]} king
# @return {Integer[][]}
def queens_attackthe_king(queens, king)
    board = Array.new(8) { Array.new(8, false) }
    queens.each do |r, c|
        board[r][c] = true
    end

    directions = [
        [-1, 0], [1, 0], [0, 1], [0, -1],
        [-1, -1], [-1, 1], [1, -1], [1, 1]
    ]

    ans = []
    directions.each do |dr, dc|
        r, c = king
        while r.between?(0, 7) && c.between?(0, 7)
            r += dr
            c += dc
            break unless r.between?(0, 7) && c.between?(0, 7)
            if board[r][c]
                ans << [r, c]
                break
            end
        end
    end

    ans
end
