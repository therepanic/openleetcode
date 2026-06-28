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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
    ser = lambda do |n|
        return ',#' if n.nil?
        ',' + n.val.to_s + ser.call(n.left) + ser.call(n.right)
    end
    ser.call(root).include?(ser.call(sub_root))
end
