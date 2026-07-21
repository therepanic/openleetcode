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
# @param {Integer} target
# @return {TreeNode}
def remove_leaf_nodes(root, target)
    def traverse_and_remove(temp, target)
        return false if temp.nil?
        if temp.left.nil? && temp.right.nil?
            return temp.val != target
        end
        left = traverse_and_remove(temp.left, target)
        right = traverse_and_remove(temp.right, target)
        temp.left = nil if !left
        temp.right = nil if !right
        return left || right || temp.val != target
    end
    
    return nil if !traverse_and_remove(root, target)
    return root
end
