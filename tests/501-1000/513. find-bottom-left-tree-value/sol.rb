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
def find_bottom_left_value(root)
    queue = [root]
    leftmost = root.val

    while !queue.empty?
        level_size = queue.size
        leftmost = queue[0].val

        level_size.times do
            node = queue.shift
            queue.push(node.left) if node.left
            queue.push(node.right) if node.right
        end
    end

    leftmost
end
