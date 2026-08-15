def find_ball(grid)
    m = grid.length
    n = grid[0].length
    result = []
    (0...n).each do |col|
        cur = col
        (0...m).each do |row|
            d = grid[row][cur]
            nxt = cur + d
            if nxt < 0 || nxt >= n || grid[row][nxt] != d
                cur = -1
                break
            end
            cur = nxt
        end
        result << cur
    end
    result
end
