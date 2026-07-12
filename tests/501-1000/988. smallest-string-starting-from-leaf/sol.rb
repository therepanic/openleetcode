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
# @return {String}
require 'set'

def smallest_from_leaf(root)
  smallest_string = ""
  node_queue = []
  
  node_queue << [root, (root.val + 97).chr]
  
  until node_queue.empty?
    node, current_string = node_queue.shift
    
    if node.left.nil? && node.right.nil?
      if smallest_string.empty? || current_string < smallest_string
        smallest_string = current_string
      end
    end
    
    if node.left
      node_queue << [node.left, (node.left.val + 97).chr + current_string]
    end
    
    if node.right
      node_queue << [node.right, (node.right.val + 97).chr + current_string]
    end
  end
  
  smallest_string
end
