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
def diameter_of_binary_tree(root)
    def height(node)
        return 0 if node.nil?
        return 1 + [height(node.left), height(node.right)].max
    end
    
    def diameter(node)
        return 0 if node.nil?
        diameter_through_node = height(node.left) + height(node.right)
        left_diameter = diameter(node.left)
        right_diameter = diameter(node.right)
        return [diameter_through_node, left_diameter, right_diameter].max
    end
    
    diameter(root)
end
