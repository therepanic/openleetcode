# @param {Character[][]} grid
# @return {Boolean}
def contains_cycle(grid)
    n = grid.length
    m = grid[0].length
    visited = Array.new(n) { Array.new(m, false) }
    
    directions = [[-1,0], [1,0], [0,-1], [0,1]]
    
    bfs = lambda do |i, j|
        queue = [[i, j, -1, -1]]
        visited[i][j] = true
        head = 0
        
        while head < queue.length
            x, y, px, py = queue[head]
            head += 1
            
            directions.each do |dx, dy|
                nx, ny = x + dx, y + dy
                next if nx < 0 || ny < 0 || nx >= n || ny >= m
                next if grid[nx][ny] != grid[x][y]
                next if nx == px && ny == py
                return true if visited[nx][ny]
                visited[nx][ny] = true
                queue.push([nx, ny, x, y])
            end
        end
        false
    end
    
    (0...n).each do |i|
        (0...m).each do |j|
            return true if !visited[i][j] && bfs.call(i, j)
        end
    end
    false
end
