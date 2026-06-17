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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
    def inorder_traversal(node)
        return [] if node.nil?
        inorder_traversal(node.left) + [node.val] + inorder_traversal(node.right)
    end

    sorted_elements = inorder_traversal(root)
    sorted_elements[k - 1]
end
