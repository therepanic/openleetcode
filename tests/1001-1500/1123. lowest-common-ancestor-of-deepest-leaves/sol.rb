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
# @return {TreeNode}
def lca_deepest_leaves(root)
  def dfs(node, depth)
    return [nil, depth] if node.nil?
    
    left_lca, left_depth = dfs(node.left, depth + 1)
    right_lca, right_depth = dfs(node.right, depth + 1)
    
    if left_depth > right_depth
      [left_lca, left_depth]
    elsif right_depth > left_depth
      [right_lca, right_depth]
    else
      [node, left_depth]
    end
  end
  
  dfs(root, 0)[0]
end
