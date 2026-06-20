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
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
    prefix_sums = Hash.new(0)
    prefix_sums[0] = 1
    
    dfs = lambda do |node, current_sum|
        return 0 if node.nil?
        current_sum += node.val
        count = prefix_sums[current_sum - target_sum]
        prefix_sums[current_sum] += 1
        count += dfs.call(node.left, current_sum)
        count += dfs.call(node.right, current_sum)
        prefix_sums[current_sum] -= 1
        count
    end
    
    dfs.call(root, 0)
end
