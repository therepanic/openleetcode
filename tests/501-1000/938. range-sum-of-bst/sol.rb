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
# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def range_sum_bst(root, low, high)
    res = [0]
    dfs = lambda do |node|
        return if node.nil?
        dfs.call(node.left)
        if low <= node.val && node.val <= high
            res[0] += node.val
        end
        dfs.call(node.right)
    end
    dfs.call(root)
    res[0]
end
