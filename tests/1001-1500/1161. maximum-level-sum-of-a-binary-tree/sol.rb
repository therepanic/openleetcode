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
def max_level_sum(root)
    idx = 0
    max_sum = -Float::INFINITY
    q = [root]
    level = 1
    while !q.empty?
        qz = q.size
        cur_sum = 0
        qz.times do
            node = q.shift
            cur_sum += node.val
            q << node.left if node.left
            q << node.right if node.right
        end
        if cur_sum > max_sum
            idx = level
            max_sum = cur_sum
        end
        level += 1
    end
    idx
end
