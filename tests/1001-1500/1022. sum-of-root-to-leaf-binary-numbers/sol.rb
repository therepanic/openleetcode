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
def sum_root_to_leaf(root)
    dfs = lambda do |node, current|
        return 0 if node.nil?
        
        current = current * 2 + node.val
        
        if node.left.nil? && node.right.nil?
            return current
        end
        
        return dfs.call(node.left, current) + dfs.call(node.right, current)
    end
    
    dfs.call(root, 0)
end
