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
# @param {Integer} k
# @return {Boolean}
def find_target(root, k)
    seen = Set.new
    
    dfs = lambda do |node|
        return false if node.nil?
        return true if seen.include?(k - node.val)
        seen.add(node.val)
        dfs.call(node.left) || dfs.call(node.right)
    end
    
    dfs.call(root)
end
