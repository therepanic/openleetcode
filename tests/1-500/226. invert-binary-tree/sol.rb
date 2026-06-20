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
# @return {TreeNode}
def invert_tree(root)
    return nil if root.nil?
    l = invert_tree(root.left)
    r = invert_tree(root.right)
    root.left = r
    root.right = l
    root
end
