# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def leaf_similar(root1, root2)
    helper = lambda do |root, leaves|
        stack = [root]
        while !stack.empty?
            curr = stack.pop
            if curr.left.nil? && curr.right.nil?
                leaves << curr.val
            end
            if curr.left
                stack.push(curr.left)
            end
            if curr.right
                stack.push(curr.right)
            end
        end
        leaves
    end
    helper.call(root1, []) == helper.call(root2, [])
end
