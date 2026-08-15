# @param {Integer[][]} matrix
# @return {Integer[][]}
def matrix_rank_transform(matrix)
    m, n = matrix.size, matrix[0].size
    mp = Hash.new { |h, k| h[k] = [] }
    (0...m).each do |i|
        (0...n).each do |j|
            mp[matrix[i][j]] << [i, j]
        end
    end
    
    rank = Array.new(m+n, 0)
    ans = Array.new(m) { Array.new(n, 0) }
    
    mp.keys.sort.each do |k|
        parent = (0...(m+n)).to_a
        find = lambda do |p|
            if p != parent[p]
                parent[p] = find.call(parent[p])
            end
            parent[p]
        end
        
        mp[k].each do |i, j|
            ii = find.call(i)
            jj = find.call(m+j)
            parent[ii] = jj
            rank[jj] = [rank[ii], rank[jj]].max
        end
        
        seen = {}
        mp[k].each do |i, j|
            ii = find.call(i)
            unless seen[ii]
                rank[ii] += 1
            end
            seen[ii] = true
            val = rank[ii]
            rank[i] = rank[m+j] = ans[i][j] = val
        end
    end
    ans
end
