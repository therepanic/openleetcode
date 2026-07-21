# @param {Integer[][]} grid
# @param {Integer} k
# @return {Integer}
def shortest_path(grid, k)
    n, m = grid.length, grid[0].length
    q = [[0, 0, k, 0]]
    visi = Set.new
    visi.add([0, 0, k])
    dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    while !q.empty?
        r, c, k_rem, d = q.shift
        return d if r == n - 1 && c == m - 1
        k_rem -= 1 if grid[r][c] == 1
        dirs.each do |dr, dc|
            nr, nc = r + dr, c + dc
            if nr >= 0 && nr < n && nc >= 0 && nc < m
                if !visi.include?([nr, nc, k_rem]) && k_rem >= 0
                    visi.add([nr, nc, k_rem])
                    q.push([nr, nc, k_rem, d + 1])
                end
            end
        end
    end
    -1
end
