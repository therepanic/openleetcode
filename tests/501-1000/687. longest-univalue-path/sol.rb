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
def longest_univalue_path(root)
    @ans = 0
    solve = lambda do |node|
        return 0 if node.nil?
        left = solve.call(node.left)
        right = solve.call(node.right)
        left_path = 0
        right_path = 0
        if node.left && node.left.val == node.val
            left_path = left + 1
        end
        if node.right && node.right.val == node.val
            right_path = right + 1
        end
        @ans = [@ans, left_path + right_path].max
        [left_path, right_path].max
    end
    solve.call(root)
    @ans
end
