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
def find_second_minimum_value(root)
    first = root.val
    second = Float::INFINITY
    
    dfs = lambda do |node|
        return if node.nil?
        if first < node.val && node.val < second
            second = node.val
        end
        dfs.call(node.left)
        dfs.call(node.right)
    end
    
    dfs.call(root)
    second == Float::INFINITY ? -1 : second
end
