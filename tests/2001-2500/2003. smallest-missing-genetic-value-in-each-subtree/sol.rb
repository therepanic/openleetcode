# @param {Integer[]} parents
# @param {Integer[]} nums
# @return {Integer[]}
def smallest_missing_value_subtree(parents, nums)
    n = parents.length
    graph = Hash.new { |h, k| h[k] = [] }
    node_one = nil
    root = nil
    
    parents.each_with_index do |parent, child|
        if parent == -1
            root = child
        else
            graph[parent] << child
        end
        node_one = child if nums[child] == 1
    end
    
    results = Array.new(n, 1)
    return results unless node_one
    
    seen = Array.new(100002, false)
    current_node = node_one
    previous_missing = 1
    
    while current_node != -1
        mark_seen(current_node, graph, seen, nums)
        previous_missing += 1 while previous_missing < 100002 && seen[previous_missing]
        results[current_node] = previous_missing
        current_node = parents[current_node]
    end
    
    results
end

def mark_seen(node, graph, seen, nums)
    unless seen[nums[node]]
        seen[nums[node]] = true
        graph[node].each { |child| mark_seen(child, graph, seen, nums) }
    end
end
