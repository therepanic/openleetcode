# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)
  stack = []
  
  nums.each do |num|
    current = TreeNode.new(num)
    
    while !stack.empty? && stack.last.val < num
      current.left = stack.pop
    end
    
    if !stack.empty?
      stack.last.right = current
    end
    
    stack.push(current)
  end
  
  stack[0]
end
