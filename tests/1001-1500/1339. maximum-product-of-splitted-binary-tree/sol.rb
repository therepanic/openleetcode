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
def max_product(root)
    mod = 1000000007
    nodes = []
    stack = [root]

    while stack.any?
        node = stack.pop
        if node
            nodes.push(node)
            stack.push(node.left)
            stack.push(node.right)
        end
    end

    sums = {}
    nodes.reverse_each do |node|
        subtotal = node.val + (sums[node.left] || 0) + (sums[node.right] || 0)
        sums[node] = subtotal
    end

    total = sums[root]
    best = 0
    sums.each_value do |subtotal|
        best = [best, subtotal * (total - subtotal)].max
    end
    return best % mod
end
