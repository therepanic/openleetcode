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
# @return {String[]}
def binary_tree_paths(root)
    res = []
    return res if root.nil?
    stack = [[root, root.val.to_s]]
    while !stack.empty?
        node, path = stack.pop
        if node.left.nil? && node.right.nil?
            res << path
        end
        if node.right
            stack << [node.right, path + "->" + node.right.val.to_s]
        end
        if node.left
            stack << [node.left, path + "->" + node.left.val.to_s]
        end
    end
    res
end
