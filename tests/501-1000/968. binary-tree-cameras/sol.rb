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
def min_camera_cover(root)
    dfs = lambda do |node|
        return 0 if node.nil?
        res = dfs.call(node.left) + dfs.call(node.right)
        curr = [
            node.left ? node.left.val : Float::INFINITY,
            node.right ? node.right.val : Float::INFINITY
        ].min
        if curr == 0
            node.val = 1
            res += 1
        elsif curr == 1
            node.val = 2
        end
        res
    end
    dfs.call(root) + (root.val == 0 ? 1 : 0)
end
