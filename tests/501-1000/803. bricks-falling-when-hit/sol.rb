# @param {Integer[][]} grid
# @param {Integer[][]} hits
# @return {Integer[]}
def hit_bricks(grid, hits)
    m, n = grid.length, grid[0].length
    
    seen = {}
    hits.each do |i, j|
        if grid[i][j] == 1
            seen[[i, j]] = true
            grid[i][j] = 0
        end
    end
    
    parent = (0...m*n+1).to_a
    rank = Array.new(m*n+1, 1)
    
    find = lambda do |p|
        if p != parent[p]
            parent[p] = find.call(parent[p])
        end
        parent[p]
    end
    
    union = lambda do |p, q|
        root_p = find.call(p)
        root_q = find.call(q)
        return false if root_p == root_q
        if rank[root_p] > rank[root_q]
            root_p, root_q = root_q, root_p
        end
        parent[root_p] = root_q
        rank[root_q] += rank[root_p]
        true
    end
    
    (0...n).each do |j|
        union.call(j, m*n) if grid[0][j] == 1
    end
    
    (0...m).each do |i|
        (0...n).each do |j|
            if grid[i][j] == 1
                if i > 0 && grid[i-1][j] == 1
                    union.call(i*n+j, (i-1)*n+j)
                end
                if j > 0 && grid[i][j-1] == 1
                    union.call(i*n+j, i*n+j-1)
                end
            end
        end
    end
    
    ans = []
    prev_stable = rank[find.call(m*n)]
    
    hits.reverse.each do |i, j|
        if seen[[i, j]]
            grid[i][j] = 1
            if i == 0
                union.call(j, m*n)
            end
            [[1,0], [-1,0], [0,1], [0,-1]].each do |di, dj|
                ii, jj = i + di, j + dj
                if ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1
                    union.call(i*n+j, ii*n+jj)
                end
            end
            curr_stable = rank[find.call(m*n)]
            ans << [0, curr_stable - prev_stable - 1].max
            prev_stable = curr_stable
        else
            ans << 0
        end
    end
    
    ans.reverse
end
