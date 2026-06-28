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
# @return {Integer[]}
def largest_values(root)
    res = []
    dfs = lambda do |node, level|
        return if node.nil?
        if level == res.length
            res << node.val
        else
            res[level] = [res[level], node.val].max
        end
        dfs.call(node.left, level + 1)
        dfs.call(node.right, level + 1)
    end
    dfs.call(root, 0)
    res
end
