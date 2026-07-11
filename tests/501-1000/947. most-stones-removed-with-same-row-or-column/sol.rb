# @param {Integer[][]} stones
# @return {Integer}
def remove_stones(stones)
    n = stones.length
    matrix = Hash.new { |h, k| h[k] = [] }
    
    (0...n).each do |i|
        (i+1...n).each do |j|
            if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]
                matrix[i] << j
                matrix[j] << i
            end
        end
    end
    
    visited = Set.new
    components = 0
    
    dfs = lambda do |idx|
        visited.add(idx)
        matrix[idx].each do |nei|
            dfs.call(nei) unless visited.include?(nei)
        end
    end
    
    (0...n).each do |i|
        unless visited.include?(i)
            components += 1
            dfs.call(i)
        end
    end
    
    n - components
end
