# @param {Integer[][]} is_infected
# @return {Integer}
def contain_virus(is_infected)
    rows = is_infected.length
    cols = is_infected[0].length
    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    total_walls = 0

    loop do
        seen = Array.new(rows) { Array.new(cols, false) }
        regions = []
        frontiers = []
        walls_needed = []

        (0...rows).each do |r|
            (0...cols).each do |c|
                next if is_infected[r][c] != 1 || seen[r][c]
                stack = [[r, c]]
                seen[r][c] = true
                region = []
                frontier = Set.new
                walls = 0
                while !stack.empty?
                    cr, cc = stack.pop
                    region << [cr, cc]
                    directions.each do |dr, dc|
                        nr = cr + dr
                        nc = cc + dc
                        next if nr < 0 || nr >= rows || nc < 0 || nc >= cols
                        if is_infected[nr][nc] == 1 && !seen[nr][nc]
                            seen[nr][nc] = true
                            stack << [nr, nc]
                        elsif is_infected[nr][nc] == 0
                            walls += 1
                            frontier.add([nr, nc])
                        end
                    end
                end
                regions << region
                frontiers << frontier
                walls_needed << walls
            end
        end

        break if regions.empty?

        target = 0
        (1...frontiers.length).each do |i|
            target = i if frontiers[i].length > frontiers[target].length
        end

        break if frontiers[target].empty?

        total_walls += walls_needed[target]

        regions[target].each do |r, c|
            is_infected[r][c] = -1
        end

        regions.each_with_index do |_, i|
            next if i == target
            frontiers[i].each do |r, c|
                is_infected[r][c] = 1
            end
        end
    end

    total_walls
end
