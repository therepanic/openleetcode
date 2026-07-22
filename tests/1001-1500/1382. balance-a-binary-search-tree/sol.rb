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
def balance_bst(root)
    vals = []
    inorder(root, vals)
    build(vals, 0, vals.length - 1)
end

def inorder(node, vals)
    return if node.nil?
    inorder(node.left, vals)
    vals << node.val
    inorder(node.right, vals)
end

def build(vals, l, r)
    return nil if l > r
    mid = (l + r) / 2
    node = TreeNode.new(vals[mid])
    node.left = build(vals, l, mid - 1)
    node.right = build(vals, mid + 1, r)
    node
end
