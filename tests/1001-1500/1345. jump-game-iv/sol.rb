# @param {Integer[]} arr
# @return {Integer}
def min_jumps(arr)
    n = arr.length
    return 0 if n == 1
    
    mp = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index { |v, i| mp[v] << i }
    
    q = [[0, 0]]
    vis = Array.new(n, 0)
    vis[0] = 1
    
    until q.empty?
        node, dist = q.shift
        return dist if node == n - 1
        
        if node - 1 >= 0 && vis[node - 1] == 0
            vis[node - 1] = 1
            q << [node - 1, dist + 1]
        end
        
        if node + 1 < n && vis[node + 1] == 0
            vis[node + 1] = 1
            q << [node + 1, dist + 1]
        end
        
        mp[arr[node]].each do |nxt|
            if vis[nxt] == 0
                vis[nxt] = 1
                q << [nxt, dist + 1]
            end
        end
        
        mp[arr[node]].clear
    end
    
    -1
end
