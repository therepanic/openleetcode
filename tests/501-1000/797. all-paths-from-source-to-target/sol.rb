# @param {Integer[][]} graph
# @return {Integer[][]}
def all_paths_source_target(graph)
    queue = [[0, [0]]]
    target = graph.length - 1
    result = []

    while !queue.empty?
        node, path = queue.shift
        if node == target
            result << path
            next
        end
        graph[node].each do |neighbor|
            queue << [neighbor, path + [neighbor]]
        end
    end

    result
end
