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
def count_nodes(root)
    return 0 if root.nil?
    
    left_depth = get_depth(root.left)
    right_depth = get_depth(root.right)
    
    if left_depth == right_depth
        return (1 << left_depth) + count_nodes(root.right)
    else
        return (1 << right_depth) + count_nodes(root.left)
    end
end

def get_depth(node)
    depth = 0
    while node
        depth += 1
        node = node.left
    end
    depth
end
