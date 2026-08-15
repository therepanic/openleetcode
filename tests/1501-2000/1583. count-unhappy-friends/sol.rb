# @param {Integer} n
# @param {Integer[][]} preferences
# @param {Integer[][]} pairs
# @return {Integer}
def unhappy_friends(n, preferences, pairs)
    graph = {}
    pairs.each do |u, v|
        graph[u] = v
        graph[v] = u
    end

    rank = Array.new(n) { Array.new(n, 0) }
    (0...n).each do |i|
        preferences[i].each_with_index do |e, j|
            rank[i][e] = j
        end
    end

    check = lambda do |u|
        v = graph[u]
        preferences[u].each do |a|
            break if a == v
            av = graph[a]
            return true if rank[a][u] < rank[a][av]
        end
        false
    end

    ans = 0
    (0...n).each do |i|
        ans += 1 if check.call(i)
    end
    ans
end
