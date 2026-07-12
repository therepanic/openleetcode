# @param {Integer[][]} richer
# @param {Integer[]} quiet
# @return {Integer[]}
def loud_and_rich(richer, quiet)
    graph = Hash.new { |h, k| h[k] = [] }
    richer.each do |a, b|
        graph[b] << a
    end
    
    n = quiet.length
    answer = Array.new(n, -1)
    
    dfs = lambda do |i|
        return answer[i] if answer[i] != -1
        answer[i] = i
        (graph[i] || []).each do |nei|
            item = dfs.call(nei)
            if quiet[item] < quiet[answer[i]]
                answer[i] = item
            end
        end
        answer[i]
    end
    
    n.times { |i| dfs.call(i) }
    answer
end
