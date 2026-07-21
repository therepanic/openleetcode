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
def sum_even_grandparent(root)
    queue = [[root, -1, -1]]
    res = 0
    while queue.any?
        node, parent, grandparent = queue.shift
        next if node.nil?
        res += node.val if grandparent % 2 == 0
        queue.push([node.left, node.val, parent]) if node.left
        queue.push([node.right, node.val, parent]) if node.right
    end
    res
end
