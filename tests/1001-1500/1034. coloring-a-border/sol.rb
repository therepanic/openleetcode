# @param {Integer[][]} grid
# @param {Integer} row
# @param {Integer} col
# @param {Integer} color
# @return {Integer[][]}
def color_border(grid, row, col, color)
    rows = grid.length
    cols = grid[0].length
    start_color = grid[row][col]
    
    return grid if start_color == color
    
    queue = [[row, col]]
    visited = { [row, col] => true }
    borders = []
    
    while !queue.empty?
        r, c = queue.shift
        is_border = false
        
        [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dr, dc|
            nr = r + dr
            nc = c + dc
            
            if !(0 <= nr && nr < rows && 0 <= nc && nc < cols)
                is_border = true
            elsif grid[nr][nc] != start_color
                is_border = true
            elsif !visited.key?([nr, nc])
                visited[[nr, nc]] = true
                queue << [nr, nc]
            end
        end
        
        borders << [r, c] if is_border
    end
    
    borders.each do |r, c|
        grid[r][c] = color
    end
    
    grid
end
