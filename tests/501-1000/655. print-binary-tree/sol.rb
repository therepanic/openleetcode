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
# @return {String[][]}
def print_tree(root)
    find_height = lambda do |node|
        return 0 if node.nil?
        height = 0
        if node.left
            height = [height, 1 + find_height.call(node.left)].max
        end
        if node.right
            height = [height, 1 + find_height.call(node.right)].max
        end
        height
    end

    height = find_height.call(root)
    m = height + 1
    n = 2**(height + 1) - 1
    matrix = Array.new(m) { Array.new(n, "") }
    queue = [[root, 0, (n - 1) / 2]]
    while !queue.empty?
        level_size = queue.length
        level_size.times do
            front_node, x, y = queue.shift
            matrix[x][y] = front_node.val.to_s
            if front_node.left
                queue.push([front_node.left, x + 1, y - 2**(height - x - 1)])
            end
            if front_node.right
                queue.push([front_node.right, x + 1, y + 2**(height - x - 1)])
            end
        end
    end
    matrix
end
