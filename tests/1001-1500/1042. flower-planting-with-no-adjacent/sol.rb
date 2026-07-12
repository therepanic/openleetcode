# @param {Integer} n
# @param {Integer[][]} paths
# @return {Integer[]}
def garden_no_adj(n, paths)
    graph = {}
    
    paths.each do |u, v|
        graph[u] = [] unless graph.key?(u)
        graph[v] = [] unless graph.key?(v)
        graph[u] << v
        graph[v] << u
    end
    
    (1..n).each do |node|
        graph[node] = [] unless graph.key?(node)
    end
    
    answer = [0] * (n + 1)
    
    (1..n).each do |i|
        used = Set.new
        graph[i].each do |nei|
            used.add(answer[nei])
        end
        
        (1..4).each do |flower|
            unless used.include?(flower)
                answer[i] = flower
                break
            end
        end
    end
    
    answer[1..-1]
end
