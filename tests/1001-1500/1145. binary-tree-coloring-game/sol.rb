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
# @param {Integer} n
# @param {Integer} x
# @return {Boolean}
def btree_game_winning_move(root, n, x)
    subtree_count = lambda do |node|
        return 0 if node.nil?
        left_count = subtree_count.call(node.left)
        right_count = subtree_count.call(node.right)
        left_count + right_count + 1
    end

    queue = [root]
    node = nil
    until queue.empty?
        front = queue.shift
        if front.val == x
            node = front
            break
        end
        queue.push(front.left) if front.left
        queue.push(front.right) if front.right
    end

    left_count = subtree_count.call(node.left)
    right_count = subtree_count.call(node.right)
    parent_count = n - left_count - right_count - 1
    if parent_count > left_count + right_count
        return true
    elsif left_count > parent_count + right_count
        return true
    elsif right_count > parent_count + left_count
        return true
    end
    false
end
