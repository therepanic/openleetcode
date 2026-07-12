# @param {String[]} strs
# @return {Integer}
def num_similar_groups(strs)
    def check_similarity(str1, str2)
        diff = 0
        str1.length.times do |i|
            diff += 1 if str1[i] != str2[i]
        end
        diff == 0 || diff == 2
    end
    
    def dfs(node, matrix, visited)
        return if visited.include?(node)
        visited.add(node)
        (matrix[node] || []).each do |nei|
            dfs(nei, matrix, visited) unless visited.include?(nei)
        end
    end
    
    n = strs.length
    matrix = Hash.new { |h, k| h[k] = [] }
    
    (0...n).each do |i|
        (0...n).each do |j|
            if check_similarity(strs[i], strs[j])
                matrix[i] << j
                matrix[j] << i
            end
        end
    end
    
    count = 0
    visited = Set.new
    (0...n).each do |start|
        unless visited.include?(start)
            dfs(start, matrix, visited)
            count += 1
        end
    end
    
    count
end
