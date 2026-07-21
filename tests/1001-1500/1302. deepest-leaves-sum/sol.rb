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
# @return {Integer}
def deepest_leaves_sum(root)
    depth_map = Hash.new(0)
    
    dfs = lambda do |node, depth|
        return unless node
        if node.left.nil? && node.right.nil?
            depth_map[depth] += node.val
        end
        dfs.call(node.left, depth + 1)
        dfs.call(node.right, depth + 1)
    end
    
    dfs.call(root, 0)
    max_depth = depth_map.keys.max
    depth_map[max_depth]
end
