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
def find_mode(root)
    lst = []
    traverse = lambda do |curr|
        if curr
            lst << curr.val
            traverse.call(curr.left)
            traverse.call(curr.right)
        end
    end
    traverse.call(root)
    d = Hash.new(0)
    lst.each { |v| d[v] += 1 }
    m = 0
    lst.each { |v| m = [m, d[v]].max }
    sol = []
    lst.each { |v| sol << v if d[v] == m }
    sol.uniq
end
