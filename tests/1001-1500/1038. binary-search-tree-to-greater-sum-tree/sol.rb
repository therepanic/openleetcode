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
def bst_to_gst(root)
    @sum = 0
    traversal = lambda do |node|
        traversal.call(node.right) if node.right
        @sum += node.val
        node.val = @sum
        traversal.call(node.left) if node.left
    end
    traversal.call(root)
    root
end
