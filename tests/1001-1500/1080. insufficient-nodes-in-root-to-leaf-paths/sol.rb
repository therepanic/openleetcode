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
# @param {Integer} limit
# @return {TreeNode}
def sufficient_subset(root, limit)
    dfs = lambda do |node, path_sum|
        return false if node.nil?
        
        curr = path_sum + node.val
        
        if node.left.nil? && node.right.nil?
            return curr >= limit
        end
        
        left_good = dfs.call(node.left, curr)
        right_good = dfs.call(node.right, curr)
        
        node.left = nil if !left_good
        node.right = nil if !right_good
        
        left_good || right_good
    end
    
    dfs.call(root, 0) ? root : nil
end
