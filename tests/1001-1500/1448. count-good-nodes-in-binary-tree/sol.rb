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
def good_nodes(root)
    dfs = lambda do |node, max_so_far|
        return 0 if node.nil?
        count = node.val >= max_so_far ? 1 : 0
        new_max = [max_so_far, node.val].max
        count += dfs.call(node.left, new_max)
        count += dfs.call(node.right, new_max)
        count
    end
    dfs.call(root, root.val)
end
