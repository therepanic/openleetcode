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
def increasing_bst(root)
    vals = []
    inord(root, vals)
    create(vals, 0)
end

def create(vals, i)
    return nil if i >= vals.length
    node = TreeNode.new(vals[i])
    node.right = create(vals, i + 1)
    node
end

def inord(root, vals)
    return if root.nil?
    inord(root.left, vals)
    vals << root.val
    inord(root.right, vals)
end
