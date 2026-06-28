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
def min_diff_in_bst(root)
    prev = nil
    min_diff = Float::INFINITY
    
    inorder = lambda do |node|
        return if node.nil?
        inorder.call(node.left)
        if prev
            diff = node.val - prev
            min_diff = diff if diff < min_diff
        end
        prev = node.val
        inorder.call(node.right)
    end
    
    inorder.call(root)
    min_diff
end
