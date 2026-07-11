# @param {Integer} n
# @param {Integer[][]} red_edges
# @param {Integer[][]} blue_edges
# @return {Integer[]}
def shortest_alternating_paths(n, red_edges, blue_edges)
    ans = Array.new(n, -1)
    graph = Array.new(n) { [] }
    q = [[0, 0]]  # [node, prevColor]: 0-init, 1-red, 2-blue
    
    red_edges.each { |u, v| graph[u] << [v, 1] }
    blue_edges.each { |u, v| graph[u] << [v, 2] }
    
    step = 0
    while !q.empty?
        q.size.times do
            u, prev_color = q.shift
            if ans[u] == -1
                ans[u] = step
            end
            graph[u].each_with_index do |(v, edge_color), i|
                next if v == -1 || edge_color == prev_color
                q << [v, edge_color]
                graph[u][i] = [-1, edge_color]
            end
        end
        step += 1
    end
    ans
end
