# @param {String[]} grid
# @return {Integer}
def shortest_path_all_keys(grid)
    m = grid.length
    n = grid[0].length
    start_i = start_j = 0
    total_keys = 0
    
    (0...m).each do |i|
        (0...n).each do |j|
            if grid[i][j] == '@'
                start_i = i
                start_j = j
            end
            if 'a' <= grid[i][j] && grid[i][j] <= 'f'
                total_keys += 1
            end
        end
    end
    
    target_mask = (1 << total_keys) - 1
    queue = [[start_i, start_j, 0]]
    seen = Set.new
    seen.add([start_i, start_j, 0])
    moves = 0
    dirs = [[0,1], [0,-1], [1,0], [-1,0]]
    
    while !queue.empty?
        queue.length.times do
            r, c, mask = queue.shift
            
            if mask == target_mask
                return moves
            end
            
            dirs.each do |dx, dy|
                nr = r + dx
                nc = c + dy
                
                next unless 0 <= nr && nr < m && 0 <= nc && nc < n
                
                next_val = grid[nr][nc]
                next_mask = mask
                
                if 'a' <= next_val && next_val <= 'f'
                    key_bit = next_val.ord - 'a'.ord
                    next_mask |= (1 << key_bit)
                end
                
                if 'A' <= next_val && next_val <= 'F'
                    lock_bit = next_val.downcase.ord - 'a'.ord
                    next unless (next_mask & (1 << lock_bit)) != 0
                end
                
                state = [nr, nc, next_mask]
                if !seen.include?(state) && next_val != '#'
                    queue.push(state)
                    seen.add(state)
                end
            end
        end
        
        moves += 1
    end
    
    return -1
end
