# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def sum_of_distances_in_tree(n, edges)
    adj = Hash.new { |h, k| h[k] = [] }
    edges.each do |u, v|
        adj[u] << v
        adj[v] << u
    end
    
    count = [1] * n
    ans = [0] * n
    
    dfs_in = lambda do |node, parent|
        adj[node].each do |child|
            next if child == parent
            dfs_in.call(child, node)
            count[node] += count[child]
            ans[node] += ans[child] + count[child]
        end
    end
    
    dfs_out = lambda do |node, parent|
        adj[node].each do |child|
            next if child == parent
            ans[child] = ans[node] - count[child] + (n - count[child])
            dfs_out.call(child, node)
        end
    end
    
    dfs_in.call(0, -1)
    dfs_out.call(0, -1)
    ans
end
