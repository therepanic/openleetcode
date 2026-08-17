# @param {String[]} grid
# @param {Integer} cat_jump
# @param {Integer} mouse_jump
# @return {Boolean}
def can_mouse_win(grid, cat_jump, mouse_jump)
    m = grid.size
    n = grid[0].size
    walls = {}
    food = cat = mouse = 0
    
    (0...m).each do |i|
        (0...n).each do |j|
            if grid[i][j] == "F"
                food = i * n + j
            elsif grid[i][j] == "C"
                cat = i * n + j
            elsif grid[i][j] == "M"
                mouse = i * n + j
            elsif grid[i][j] == "#"
                walls[i * n + j] = true
            end
        end
    end
    
    memo = {}
    solve = lambda do |cat_pos, mouse_pos, turn|
        key = (cat_pos * m * n + mouse_pos) * (m * n * 2) + turn
        return memo[key] if memo.key?(key)
        
        if cat_pos == food || cat_pos == mouse_pos || turn >= m*n*2
            return memo[key] = false
        end
        if mouse_pos == food
            return memo[key] = true
        end
        
        if turn % 2 == 0  # mouse
            x, y = mouse_pos.divmod(n)
            [[-1,0],[0,1],[1,0],[0,-1]].each do |dx, dy|
                (0..mouse_jump).each do |jump|
                    xx, yy = x + jump*dx, y + jump*dy
                    break if xx < 0 || xx >= m || yy < 0 || yy >= n || walls[xx * n + yy]
                    if solve.call(cat_pos, xx * n + yy, turn+1)
                        return memo[key] = true
                    end
                end
            end
            return memo[key] = false
        else  # cat
            x, y = cat_pos.divmod(n)
            [[-1,0],[0,1],[1,0],[0,-1]].each do |dx, dy|
                (0..cat_jump).each do |jump|
                    xx, yy = x + jump*dx, y + jump*dy
                    break if xx < 0 || xx >= m || yy < 0 || yy >= n || walls[xx * n + yy]
                    if !solve.call(xx * n + yy, mouse_pos, turn+1)
                        return memo[key] = false
                    end
                end
            end
            return memo[key] = true
        end
    end
    
    solve.call(cat, mouse, 0)
end
