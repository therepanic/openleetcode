# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def count_paths(n, roads)
    graph = Array.new(n) { [] }
    roads.each do |u, v, time|
        graph[u] << [v, time]
        graph[v] << [u, time]
    end
    
    dist = Array.new(n, Float::INFINITY)
    ways = Array.new(n, 0)
    
    dist[0] = 0
    ways[0] = 1
    
    pq = [[0, 0]]
    
    mod = 10**9 + 7
    
    until pq.empty?
        d, node = pq.shift
        
        if d > dist[node]
            next
        end
            
        graph[node].each do |neighbor, time|
            if dist[node] + time < dist[neighbor]
                dist[neighbor] = dist[node] + time
                ways[neighbor] = ways[node]
                pq << [dist[neighbor], neighbor]
                pq.sort_by! { |a| a[0] }
            elsif dist[node] + time == dist[neighbor]
                ways[neighbor] = (ways[neighbor] + ways[node]) % mod
            end
        end
    end
    
    ways[n-1]
end
