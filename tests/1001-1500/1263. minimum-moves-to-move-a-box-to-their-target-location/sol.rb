# @param {Character[][]} grid
# @return {Integer}
def min_push_box(grid)
    rows = grid.length
    cols = grid[0].length
    player = nil
    box = nil
    target = nil
    
    (0...rows).each do |i|
        (0...cols).each do |j|
            case grid[i][j]
            when 'S' then player = [i, j]
            when 'B' then box = [i, j]
            when 'T' then target = [i, j]
            end
        end
    end
    
    q = [[box, player, 0]]
    seen = Set.new
    seen.add([box, player])
    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    
    until q.empty?
        box, player, pushes = q.shift
        return pushes if box == target
        
        reachable = Set.new
        reachable.add(player)
        walk = [player]
        until walk.empty?
            x, y = walk.shift
            directions.each do |dx, dy|
                nx, ny = x + dx, y + dy
                if nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
                   [nx, ny] != box && grid[nx][ny] != '#' &&
                   !reachable.include?([nx, ny])
                    reachable.add([nx, ny])
                    walk.push([nx, ny])
                end
            end
        end
        
        directions.each do |dx, dy|
            next_box = [box[0] + dx, box[1] + dy]
            behind = [box[0] - dx, box[1] - dy]
            if next_box[0] >= 0 && next_box[0] < rows && next_box[1] >= 0 && next_box[1] < cols &&
               grid[next_box[0]][next_box[1]] != '#' &&
               reachable.include?(behind) &&
               !seen.include?([next_box, box])
                seen.add([next_box, box])
                q.push([next_box, box, pushes + 1])
            end
        end
    end
    
    -1
end
