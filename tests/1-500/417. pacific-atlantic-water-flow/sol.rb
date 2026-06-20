# @param {Integer[][]} heights
# @return {Integer[][]}
def pacific_atlantic(heights)
    return [] if heights.empty?
    m, n = heights.length, heights[0].length
    directions = [[1,0], [-1,0], [0,1], [0,-1]]
    
    pacific = Set.new
    atlantic = Set.new
    
    dfs = lambda do |i, j, visited|
        visited.add([i, j])
        directions.each do |dx, dy|
            x, y = i + dx, j + dy
            if x >= 0 && x < m && y >= 0 && y < n
                if !visited.include?([x, y]) && heights[x][y] >= heights[i][j]
                    dfs.call(x, y, visited)
                end
            end
        end
    end
    
    (0...n).each { |j| dfs.call(0, j, pacific) }
    (0...m).each { |i| dfs.call(i, 0, pacific) }
    (0...n).each { |j| dfs.call(m-1, j, atlantic) }
    (0...m).each { |i| dfs.call(i, n-1, atlantic) }
    
    (pacific & atlantic).to_a
end
