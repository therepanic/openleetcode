# @param {Integer[][]} grid
# @return {Integer}
def minimum_moves(grid)
    n = grid.length
    start = [0, 0, 0]
    target = [n - 1, n - 2, 0]
    
    queue = [[start, 0]]
    visited = Set.new
    visited.add(start)
    
    while !queue.empty?
        state, dist = queue.shift
        r, c, o = state
        
        return dist if r == target[0] && c == target[1] && o == target[2]
        
        if o == 0
            if c + 2 < n && grid[r][c + 2] == 0
                new_state = [r, c + 1, 0]
                unless visited.include?(new_state)
                    visited.add(new_state)
                    queue.push([new_state, dist + 1])
                end
            end
            if r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0
                new_state = [r + 1, c, 0]
                unless visited.include?(new_state)
                    visited.add(new_state)
                    queue.push([new_state, dist + 1])
                end
            end
        else
            if c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0
                new_state = [r, c + 1, 1]
                unless visited.include?(new_state)
                    visited.add(new_state)
                    queue.push([new_state, dist + 1])
                end
            end
            if r + 2 < n && grid[r + 2][c] == 0
                new_state = [r + 1, c, 1]
                unless visited.include?(new_state)
                    visited.add(new_state)
                    queue.push([new_state, dist + 1])
                end
            end
        end
        
        if r + 1 < n && c + 1 < n &&
           grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0
            new_o = 1 - o
            new_state = [r, c, new_o]
            unless visited.include?(new_state)
                visited.add(new_state)
                queue.push([new_state, dist + 1])
            end
        end
    end
    
    -1
end
