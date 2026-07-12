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
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
    res = []
    stack = [[root, nil, 0]]
    while stack.length > 0
        curr, parent, depth = stack.pop
        if curr.val == x || curr.val == y
            res << [parent, depth]
        end
        if curr.left
            stack << [curr.left, curr, depth + 1]
        end
        if curr.right
            stack << [curr.right, curr, depth + 1]
        end
    end
    return res.length == 2 && res[0][1] == res[1][1] && res[0][0] != res[1][0]
end
