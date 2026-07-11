# @param {String[]} grid
# @return {Integer}
def regions_by_slashes(grid)
    n = grid.length
    parents = (0...4*n*n).to_a
    count = 4 * n * n

    find = ->(x) {
        while x != parents[x]
            parents[x] = parents[parents[x]]
            x = parents[x]
        end
        x
    }

    union = ->(x, y) {
        rx, ry = find.call(x), find.call(y)
        if rx != ry
            parents[rx] = ry
            true
        else
            false
        end
    }

    merges = {
        ' ' => [[0, 1], [1, 2], [2, 3]],
        '/' => [[0, 3], [1, 2]],
        '\\' => [[0, 1], [2, 3]]
    }

    (0...n).each do |i|
        (0...n).each do |j|
            base = (i * n + j) * 4
            merges[grid[i][j]].each do |u, v|
                if union.call(base + u, base + v)
                    count -= 1
                end
            end

            if i + 1 < n
                down_base = ((i + 1) * n + j) * 4
                if union.call(base + 2, down_base)
                    count -= 1
                end
            end

            if j + 1 < n
                right_base = ((j + 1) + n * i) * 4
                if union.call(base + 1, right_base + 3)
                    count -= 1
                end
            end
        end
    end

    count
end
