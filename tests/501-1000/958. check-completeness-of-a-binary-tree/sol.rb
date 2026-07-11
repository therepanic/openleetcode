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
# @return {Boolean}
def is_complete_tree(root)
    q = [root]
    past = false
    while !q.empty?
        node = q.shift
        if node.nil?
            past = true
        else
            return false if past
            q.push(node.left)
            q.push(node.right)
        end
    end
    true
end
