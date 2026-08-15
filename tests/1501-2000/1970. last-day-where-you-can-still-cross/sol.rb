# @param {Integer} row
# @param {Integer} col
# @param {Integer[][]} cells
# @return {Integer}
def latest_day_to_cross(row, col, cells)
    can_cross = ->(day) {
        grid = Array.new(row) { Array.new(col, 0) }
        (0...day).each do |i|
            r = cells[i][0] - 1
            c = cells[i][1] - 1
            grid[r][c] = 1
        end
        
        queue = []
        visited = Array.new(row) { Array.new(col, false) }
        head = 0
        
        (0...col).each do |c|
            if grid[0][c] == 0
                queue << [0, c]
                visited[0][c] = true
            end
        end
        
        directions = [[1,0], [-1,0], [0,1], [0,-1]]
        
        while head < queue.length
            r, c = queue[head]
            head += 1
            return true if r == row - 1
            directions.each do |dr, dc|
                nr, nc = r + dr, c + dc
                if nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0
                    visited[nr][nc] = true
                    queue << [nr, nc]
                end
            end
        end
        false
    }
    
    left, right = 1, cells.length
    answer = 0
    while left <= right
        mid = (left + right) / 2
        if can_cross.call(mid)
            answer = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    answer
end
