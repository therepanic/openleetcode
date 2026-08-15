# @param {String} colors
# @param {Integer[][]} edges
# @return {Integer}
def largest_path_value(colors, edges)
    inf = Float::INFINITY
    n = colors.length
    adj = Hash.new { |h, k| h[k] = [] }
    edges.each do |u, v|
        adj[u] << v
    end
    
    count = Array.new(n) { Array.new(26, 0) }
    vis = Array.new(n, 0)
    
    dfs = lambda do |node|
        if vis[node] == 1
            return inf
        end
        if vis[node] == 2
            return count[node][colors[node].ord - 'a'.ord]
        end
        
        vis[node] = 1
        adj[node].each do |nxt|
            res = dfs.call(nxt)
            if res == inf
                return inf
            end
            (0...26).each do |c|
                count[node][c] = [count[node][c], count[nxt][c]].max
            end
        end
        
        col = colors[node].ord - 'a'.ord
        count[node][col] += 1
        vis[node] = 2
        count[node][col]
    end
    
    ans = 0
    (0...n).each do |i|
        val = dfs.call(i)
        if val == inf
            return -1
        end
        ans = [ans, val].max
    end
    
    ans
end
