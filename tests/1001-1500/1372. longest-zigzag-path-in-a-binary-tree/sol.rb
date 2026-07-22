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
def longest_zig_zag(root)
    return 0 if root.nil?
    best = 0
    stack = [[root, 0, 0]]
    while !stack.empty?
        node, ended_left, ended_right = stack.pop
        best = [best, ended_left, ended_right].max
        if node.left
            stack.push([node.left, ended_right + 1, 0])
        end
        if node.right
            stack.push([node.right, 0, ended_left + 1])
        end
    end
    best
end
