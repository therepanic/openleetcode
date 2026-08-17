# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} distance
# @return {Integer}
def count_pairs(root, distance)
    graph = {}

    dfs = lambda do |node, parent|
        return if node.nil?
        if parent
            graph[parent] ||= []
            graph[node] ||= []
            graph[parent] << node
            graph[node] << parent
        end
        dfs.call(node.left, node)
        dfs.call(node.right, node)
    end

    dfs.call(root, nil)

    leaves = graph.keys.select { |n| n.left.nil? && n.right.nil? }
    ans = 0

    leaves.each_with_index do |leaf, i|
        q = [[leaf, 0]]
        visited = [leaf]

        until q.empty?
            node, dist = q.shift
            next if dist >= distance
            (graph[node] || []).each do |nei|
                unless visited.include?(nei)
                    visited << nei
                    q << [nei, dist + 1]
                    if leaves.include?(nei) && leaves.index(nei) > i
                        ans += 1
                    end
                end
            end
        end
    end

    ans
end
