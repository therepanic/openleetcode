def nearest_exit(maze, entrance)
    n = maze.length
    m = maze[0].length
    visited = Array.new(n) { Array.new(m, false) }
    q = [[entrance[0], entrance[1], 0]]
    visited[entrance[0]][entrance[1]] = true
    dirs = [[-1,0],[1,0],[0,-1],[0,1]]
    
    until q.empty?
        r, c, dist = q.shift
        dirs.each do |dr, dc|
            nr, nc = r+dr, c+dc
            if nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == "."
                visited[nr][nc] = true
                if nr == 0 || nc == 0 || nr == n-1 || nc == m-1
                    return dist+1
                end
                q << [nr, nc, dist+1]
            end
        end
    end
    -1
end
