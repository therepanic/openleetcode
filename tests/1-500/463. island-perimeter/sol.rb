# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
    rows = grid.length
    cols = grid[0].length
    visited = Set.new
    
    start = nil
    (0...rows).each do |r|
        (0...cols).each do |c|
            if grid[r][c] == 1
                start = [r, c]
                break
            end
        end
        break if start
    end
    
    queue = [start]
    visited.add(start)
    perimeter = 0
    
    while !queue.empty?
        r, c = queue.shift
        
        [[-1,0],[1,0],[0,-1],[0,1]].each do |dr, dc|
            nr, nc = r + dr, c + dc
            
            if nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0
                perimeter += 1
            elsif !visited.include?([nr, nc])
                visited.add([nr, nc])
                queue.push([nr, nc])
            end
        end
    end
    
    perimeter
end
