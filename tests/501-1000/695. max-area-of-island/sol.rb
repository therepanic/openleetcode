# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
    rows = grid.length
    cols = grid[0].length
    visited = Set.new
    max_island = 0
    
    dfs = lambda do |r, c|
        if r < 0 || r >= rows || c < 0 || c >= cols || visited.include?([r, c]) || grid[r][c] == 0
            return 0
        end
        
        visited.add([r, c])
        
        return 1 + dfs.call(r+1, c) + dfs.call(r-1, c) + dfs.call(r, c+1) + dfs.call(r, c-1)
    end
    
    (0...rows).each do |r|
        (0...cols).each do |c|
            if grid[r][c] == 1 && !visited.include?([r, c])
                max_island = [max_island, dfs.call(r, c)].max
            end
        end
    end
    
    max_island
end
