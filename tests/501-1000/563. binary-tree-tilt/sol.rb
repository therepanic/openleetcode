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
def find_tilt(root)
    @ans = 0
    helper = lambda do |n|
        return 0 if n.nil?
        l = helper.call(n.left)
        r = helper.call(n.right)
        @ans += (l - r).abs
        l + r + n.val
    end
    helper.call(root)
    @ans
end
