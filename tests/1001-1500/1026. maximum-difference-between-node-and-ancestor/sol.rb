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
def max_ancestor_diff(root)
    m = [0]
    dfs(root, m)
    m[0]
end

def dfs(root, m)
    return [Float::INFINITY, -Float::INFINITY] if root.nil?
    left = dfs(root.left, m)
    right = dfs(root.right, m)
    min_val = [root.val, left[0], right[0]].min
    max_val = [root.val, left[1], right[1]].max
    m[0] = [m[0], (min_val - root.val).abs, (max_val - root.val).abs].max
    return [min_val, max_val]
end
