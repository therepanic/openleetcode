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
def width_of_binary_tree(root)
    q = [root]
    ind = [0]
    res = []
    while !q.empty?
        l = []
        size = q.size
        size.times do
            node = q.shift
            i = ind.shift
            if node
                l << i
                if node.left
                    q << node.left
                    ind << 2 * i + 1
                end
                if node.right
                    q << node.right
                    ind << 2 * i + 2
                end
            end
        end
        res << l
    end
    max_width = 0
    res.each do |r|
        if r.size >= 1
            width = r[-1] - r[0] + 1
            max_width = [max_width, width].max
        end
    end
    max_width
end
