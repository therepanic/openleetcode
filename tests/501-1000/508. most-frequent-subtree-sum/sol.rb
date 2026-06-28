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
# @return {Integer[]}
def find_frequent_tree_sum(root)
  c = Hash.new(0)
  s = lambda do |n|
    return 0 if n.nil?
    r = n.val + s.call(n.left) + s.call(n.right)
    c[r] += 1
    r
  end
  s.call(root)
  m = c.values.max
  c.select { |k, v| v == m }.keys
end
