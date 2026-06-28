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
def convert_bst(root)
    total = 0

    traverse = lambda do |node|
        return if node.nil?
        traverse.call(node.right)
        total += node.val
        node.val = total
        traverse.call(node.left)
    end

    traverse.call(root)
    root
end
