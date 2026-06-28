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
# @param {Integer} low
# @param {Integer} high
# @return {TreeNode}
def trim_bst(root, low, high)
    return nil if root.nil?
    
    if root.val < low
        return trim_bst(root.right, low, high)
    end
    if root.val > high
        return trim_bst(root.left, low, high)
    end
    
    root.left = trim_bst(root.left, low, high)
    root.right = trim_bst(root.right, low, high)
    
    root
end
