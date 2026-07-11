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
def prune_tree(root)
    def traverse_and_remove(temp)
        return false if temp.nil?
        if temp.left.nil? && temp.right.nil?
            return temp.val == 1
        end
        left = traverse_and_remove(temp.left)
        right = traverse_and_remove(temp.right)
        temp.left = nil if !left
        temp.right = nil if !right
        return left || right || temp.val == 1
    end
    
    traverse_and_remove(root)
    if root.left.nil? && root.right.nil? && root.val == 0
        return nil
    end
    return root
end
