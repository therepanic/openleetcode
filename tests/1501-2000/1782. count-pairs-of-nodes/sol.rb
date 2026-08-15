# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer[]} queries
# @return {Integer[]}
def count_pairs(n, edges, queries)
    x = Hash.new { |h, k| h[k] = Set.new }
    edge = Array.new(n, 0)
    edge_pair = Hash.new(0)

    edges.each do |i, j|
        x[i-1].add(j-1)
        x[j-1].add(i-1)
        edge[i-1] += 1
        edge[j-1] += 1
        edge_pair[[i-1, j-1]] += 1
        edge_pair[[j-1, i-1]] += 1
    end
    
    res = edge.sort
    
    binse = ->(threshold) do
        i = 0
        j = n - 1
        ans = n
        while i <= j
            mid = (i + j) / 2
            if res[mid] > threshold
                ans = mid
                j = mid - 1
            else
                i = mid + 1
            end
        end
        n - ans
    end
    
    final_result = []
    
    queries.each do |query|
        v = Set.new
        ans = 0
        f = nil
        f = ->(i) do
            v.add(i)
            a = binse.call(query - edge[i])
            
            if edge[i] > query - edge[i]
                a -= 1
            end
            
            x[i].each do |j|
                if edge[j] > query - edge[i] && edge[j] - edge_pair[[i, j]] <= query - edge[i]
                    a -= 1
                end
                
                if !v.include?(j)
                    f.call(j)
                end
            end
            ans += a
        end
        
        (0...n).each do |j|
            if !v.include?(j)
                f.call(j)
            end
        end
        
        final_result << ans / 2
    end
    
    final_result
end
