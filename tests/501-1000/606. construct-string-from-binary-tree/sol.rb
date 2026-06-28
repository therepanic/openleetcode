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
# @return {String}
def tree2str(root)
    return "" if root.nil?
    s = root.val.to_s
    if root.left || root.right
        s += "(" + tree2str(root.left) + ")"
    end
    if root.right
        s += "(" + tree2str(root.right) + ")"
    end
    s
end
