# @param {Integer[][]} grid
# @return {Integer}
def min_cost(grid)
    m = grid.length
    n = grid[0].length
    min_cost = Array.new(m) { Array.new(n, Float::INFINITY) }
    min_cost[0][0] = 0
    
    deque = [[0, 0]]
    
    directions = [
        [0, 1],  # right
        [0, -1], # left
        [1, 0],  # down
        [-1, 0]  # up
    ]
    
    while !deque.empty?
        r, c = deque.shift
        
        directions.each_with_index do |(dr, dc), i|
            nr = r + dr
            nc = c + dc
            cost = (grid[r][c] != i + 1) ? 1 : 0
            
            if nr >= 0 && nr < m && nc >= 0 && nc < n && min_cost[r][c] + cost < min_cost[nr][nc]
                min_cost[nr][nc] = min_cost[r][c] + cost
                
                if cost == 1
                    deque.push([nr, nc])
                else
                    deque.unshift([nr, nc])
                end
            end
        end
    end
    
    min_cost[m - 1][n - 1]
end
