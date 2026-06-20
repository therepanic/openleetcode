# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    while root
        if [p.val, q.val].min > root.val
            root = root.right
        elsif [p.val, q.val].max < root.val
            root = root.left
        else
            return root
        end
    end
end
