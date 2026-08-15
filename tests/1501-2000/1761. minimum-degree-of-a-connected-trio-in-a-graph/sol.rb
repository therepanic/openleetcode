# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def min_trio_degree(n, edges)
    adj = Array.new(n+1) { Array.new(n+1,0) }
    deg = Array.new(n+1,0)
    edges.each do |u,v|
        adj[u][v]=1
        adj[v][u]=1
        deg[u]+=1
        deg[v]+=1
    end
    ans = Float::INFINITY
    edges.each do |u,v|
        (1..n).each do |w|
            if adj[u][w]==1 && adj[v][w]==1
                ans = [ans, deg[u]+deg[v]+deg[w]-6].min
            end
        end
    end
    ans==Float::INFINITY ? -1 : ans
end
