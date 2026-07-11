# @param {Integer} n
# @param {Integer[][]} lamps
# @param {Integer[][]} queries
# @return {Integer[]}
def grid_illumination(n, lamps, queries)
    row_count = Hash.new(0)
    col_count = Hash.new(0)
    diagonal1 = Hash.new(0)
    diagonal2 = Hash.new(0)
    lamp_set = Set.new
    ans = []
    directions = [[-1,-1], [-1,0], [-1,1], 
                  [0,-1],  [0,0],  [0,1], 
                  [1,-1],  [1,0],  [1,1]]
    lamps.each do |row, col|
        unless lamp_set.include?([row, col])
            lamp_set.add([row, col])
            row_count[row] += 1
            col_count[col] += 1
            diagonal1[row - col] += 1
            diagonal2[row + col] += 1
        end
    end
    queries.each do |row, col|
        if row_count[row] > 0 || col_count[col] > 0 || diagonal1[row - col] > 0 || diagonal2[row + col] > 0
            ans << 1
            directions.each do |dr, dc|
                nr, nc = row + dr, col + dc
                if lamp_set.include?([nr, nc])
                    lamp_set.delete([nr, nc])
                    row_count[nr] -= 1
                    col_count[nc] -= 1
                    diagonal1[nr - nc] -= 1
                    diagonal2[nr + nc] -= 1
                end
            end
        else
            ans << 0
        end
    end
    ans
end
