# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
    n, m = grid.length, grid[0].length
    q = []
    fresh = 0

    (0...n).each do |i|
        (0...m).each do |j|
            if grid[i][j] == 2
                q << [i, j, 0]
            elsif grid[i][j] == 1
                fresh += 1
            end
        end
    end

    directions = [[-1,0],[1,0],[0,-1],[0,1]]
    max_time = 0
    rotten = 0

    while !q.empty?
        r, c, t = q.shift
        max_time = t if t > max_time

        directions.each do |dr, dc|
            nr, nc = r + dr, c + dc
            if nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1
                grid[nr][nc] = 2
                q << [nr, nc, t+1]
                rotten += 1
            end
        end
    end

    rotten == fresh ? max_time : -1
end
