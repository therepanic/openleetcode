# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} distance_threshold
# @return {Integer}
def find_the_city(n, edges, distance_threshold)
    inf = Float::INFINITY
    matrix = Array.new(n) { Array.new(n, inf) }
    
    (0...n).each { |i| matrix[i][i] = 0 }
    
    edges.each do |u, v, w|
        matrix[u][v] = matrix[v][u] = w
    end
    
    (0...n).each do |via|
        (0...n).each do |i|
            (0...n).each do |j|
                if matrix[i][via] + matrix[via][j] < matrix[i][j]
                    matrix[i][j] = matrix[i][via] + matrix[via][j]
                end
            end
        end
    end
    
    min_reachable = n
    ans = -1
    
    (0...n).each do |i|
        count = (0...n).count { |j| matrix[i][j] <= distance_threshold }
        if count <= min_reachable
            min_reachable = count
            ans = i
        end
    end
    
    ans
end
