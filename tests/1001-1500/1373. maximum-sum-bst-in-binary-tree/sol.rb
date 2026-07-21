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
def max_sum_bst(root)
    @best = 0

    dfs = lambda do |node|
        return [true, Float::INFINITY, -Float::INFINITY, 0] if node.nil?
        
        lbst, lmin, lmax, lsum = dfs.call(node.left)
        rbst, rmin, rmax, rsum = dfs.call(node.right)
        
        if lbst && rbst && lmax < node.val && node.val < rmin
            total = lsum + rsum + node.val
            @best = [@best, total].max
            return [true, [lmin, node.val].min, [rmax, node.val].max, total]
        end
        
        return [false, -Float::INFINITY, Float::INFINITY, 0]
    end

    dfs.call(root)
    @best
end
