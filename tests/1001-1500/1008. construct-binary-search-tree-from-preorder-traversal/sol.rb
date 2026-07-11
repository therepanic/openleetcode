# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @return {TreeNode}
def bst_from_preorder(preorder)
    return nil if preorder.empty?
    root = TreeNode.new(preorder[0])
    i = 1
    while i < preorder.length && preorder[i] < root.val
        i += 1
    end
    root.left = bst_from_preorder(preorder[1...i])
    root.right = bst_from_preorder(preorder[i..-1])
    return root
end
