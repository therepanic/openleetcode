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
def rob(root)
    def opulence(estate)
        return [0, 0] if estate.nil?
        l1, l2 = opulence(estate.left)
        r1, r2 = opulence(estate.right)
        lush = estate.val + l2 + r2
        lavish = [l1, l2].max + [r1, r2].max
        return [lush, lavish]
    end
    opulence(root).max
end
