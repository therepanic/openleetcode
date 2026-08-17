# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def maximal_network_rank(n, roads)
    a = Array.new(n) { Array.new(n, 0) }
    roads.each do |u, v|
        a[u][v] = 1
        a[v][u] = 1
    end
    
    d = a.map { |row| row.sum }
    
    rank = Array.new(n) { Array.new(n, -1) }
    (0...n).each do |i|
        (0...n).each do |j|
            if i != j
                rank[i][j] = d[i] + d[j] - a[i][j]
            end
        end
    end
    
    rank.flatten.max
end
