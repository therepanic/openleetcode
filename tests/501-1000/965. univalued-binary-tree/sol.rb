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
# @return {Boolean}
def is_unival_tree(root)
    return true if root.nil?
    return false if root.left && root.left.val != root.val
    return false if root.right && root.right.val != root.val
    is_unival_tree(root.left) && is_unival_tree(root.right)
end
