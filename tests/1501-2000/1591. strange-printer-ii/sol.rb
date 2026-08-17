# @param {Integer[][]} target_grid
# @return {Boolean}
def is_printable(target_grid)
    colors = Hash.new { |h, k| h[k] = [] }
    (0...target_grid.length).each do |i|
        (0...target_grid[0].length).each do |j|
            colors[target_grid[i][j]] << [i, j]
        end
    end
    
    def check_and_clear(grid, color, positions)
        rows = positions.map(&:first)
        cols = positions.map(&:last)
        mn_r, mx_r = rows.min, rows.max + 1
        mn_c, mx_c = cols.min, cols.max + 1
        
        (mn_r...mx_r).each do |i|
            (mn_c...mx_c).each do |j|
                return false if grid[i][j] != color && grid[i][j] > 0
            end
        end
        
        (mn_r...mx_r).each do |i|
            (mn_c...mx_c).each do |j|
                grid[i][j] = 0
            end
        end
        true
    end
    
    color_set = colors.keys.to_set
    while !color_set.empty?
        removable = color_set.select { |c| check_and_clear(target_grid, c, colors[c]) }
        return false if removable.empty?
        color_set -= removable
    end
    true
end
