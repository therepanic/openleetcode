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
# @return {TreeNode[]}
def find_duplicate_subtrees(root)
    seen = {}
    ans = []
    
    solve = lambda do |node|
        return "#" if node.nil?
        left = solve.call(node.left)
        right = solve.call(node.right)
        curr_tree = "#{node.val}, #{left}, #{right}"
        seen[curr_tree] = seen.fetch(curr_tree, 0) + 1
        ans << node if seen[curr_tree] == 2
        curr_tree
    end
    
    solve.call(root)
    ans
end
