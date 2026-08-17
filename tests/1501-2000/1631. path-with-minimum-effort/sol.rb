def minimum_effort_path(heights)
    return 0 if heights.nil? || heights.empty?
    rows, cols = heights.length, heights[0].length
    lo, hi = 0, 1_000_000
    while lo < hi
        mid = (lo + hi) / 2
        seen = Array.new(rows) { Array.new(cols, false) }
        queue = [[0, 0]]
        seen[0][0] = true
        head = 0
        while head < queue.length
            r, c = queue[head]
            head += 1
            [[1,0],[-1,0],[0,1],[0,-1]].each do |dr, dc|
                nr, nc = r + dr, c + dc
                next unless nr >= 0 && nr < rows && nc >= 0 && nc < cols && !seen[nr][nc]
                next if (heights[nr][nc] - heights[r][c]).abs > mid
                seen[nr][nc] = true
                queue << [nr, nc]
            end
        end
        if seen[rows - 1][cols - 1]
            hi = mid
        else
            lo = mid + 1
        end
    end
    lo
end
