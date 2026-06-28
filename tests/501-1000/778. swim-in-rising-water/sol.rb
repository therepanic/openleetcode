# @param {Integer[][]} grid
# @return {Integer}
def swim_in_water(grid)
    n = grid.length
    dirs = [[0,-1],[0,1],[-1,0],[1,0]]

    dfs = lambda do |x, y, t, vis|
        return true if x == n-1 && y == n-1
        vis[x][y] = true
        dirs.each do |dx, dy|
            nx, ny = x+dx, y+dy
            if nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t
                if dfs.call(nx, ny, t, vis)
                    return true
                end
            end
        end
        false
    end

    low, high, ans = 0, n*n - 1, Float::INFINITY
    while low <= high
        mid = (low + high) / 2
        vis = Array.new(n) { Array.new(n, false) }
        if grid[0][0] <= mid && dfs.call(0, 0, mid, vis)
            ans = mid
            high = mid - 1
        else
            low = mid + 1
        end
    end
    ans
end
