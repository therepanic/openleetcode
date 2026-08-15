# @param {Integer[][]} land
# @return {Integer[][]}
def find_farmland(land)
    n = land.length
    m = land[0].length
    visited = Array.new(n) { Array.new(m, false) }
    directions = [[-1,0],[0,1],[1,0],[0,-1]]
    
    dfs = lambda do |r, c, maxr, maxc|
        visited[r][c] = true
        maxr[0] = [maxr[0], r].max
        maxc[0] = [maxc[0], c].max
        directions.each do |dr, dc|
            nr, nc = r + dr, c + dc
            if nr >= 0 && nr < n && nc >= 0 && nc < m
                if !visited[nr][nc] && land[nr][nc] == 1
                    dfs.call(nr, nc, maxr, maxc)
                end
            end
        end
    end
    
    res = []
    (0...n).each do |i|
        (0...m).each do |j|
            if land[i][j] == 1 && !visited[i][j]
                maxr = [i]
                maxc = [j]
                dfs.call(i, j, maxr, maxc)
                res << [i, j, maxr[0], maxc[0]]
            end
        end
    end
    res
end
