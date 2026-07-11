# @param {Integer[][]} grid
# @return {Integer}
def largest_island(grid)
    r = grid.length
    c = grid[0].length
    dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    island = 2
    a = Hash.new(0)
    
    dfs = lambda do |i, j, x|
        tot = 1
        grid[i][j] = x
        dirs.each do |dx, dy|
            nx = i + dx
            ny = j + dy
            if nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1
                tot += dfs.call(nx, ny, x)
            end
        end
        tot
    end
    
    (0...r).each do |i|
        (0...c).each do |j|
            if grid[i][j] == 1
                a[island] = dfs.call(i, j, island)
                island += 1
            end
        end
    end
    
    res = 0
    (0...r).each do |i|
        (0...c).each do |j|
            if grid[i][j] == 0
                y = Set.new
                dirs.each do |dx, dy|
                    nx = i + dx
                    ny = j + dy
                    if nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0
                        y.add(grid[nx][ny])
                    end
                end
                tot = 1
                y.each do |b|
                    tot += a[b]
                end
                res = [res, tot].max
            end
        end
    end
    
    [res, a[2] || 0].max
end
