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
def get_minimum_difference(root)
    @prev = nil
    @ans = Float::INFINITY

    dfs = lambda do |node|
        if node
            dfs.call(node.left)
            if @prev
                @ans = [@ans, node.val - @prev].min
            end
            @prev = node.val
            dfs.call(node.right)
        end
    end

    dfs.call(root)
    @ans
end
