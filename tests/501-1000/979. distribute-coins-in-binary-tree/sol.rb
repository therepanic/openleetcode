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
def distribute_coins(root)
    @moves = 0
    
    def solve(node)
        return 0 if node.nil?
        left_candie = solve(node.left)
        right_candie = solve(node.right)
        @moves += left_candie.abs + right_candie.abs
        return (left_candie + right_candie + node.val) - 1
    end
    
    solve(root)
    @moves
end
