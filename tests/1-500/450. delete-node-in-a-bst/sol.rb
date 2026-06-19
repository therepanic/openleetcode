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
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
    return nil if root.nil?
    return helper(root) if root.val == key
    
    dummy = root
    while root
        if root.val > key
            if root.left && root.left.val == key
                root.left = helper(root.left)
                break
            else
                root = root.left
            end
        else
            if root.right && root.right.val == key
                root.right = helper(root.right)
                break
            else
                root = root.right
            end
        end
    end
    dummy
end

def helper(root)
    return root.right if root.left.nil?
    return root.left if root.right.nil?
    
    right_child = root.right
    last_right = flr(root.left)
    last_right.right = right_child
    root.left
end

def flr(root)
    return root if root.right.nil?
    flr(root.right)
end
