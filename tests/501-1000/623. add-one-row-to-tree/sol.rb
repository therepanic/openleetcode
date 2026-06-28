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
# @param {Integer} val
# @param {Integer} depth
# @return {TreeNode}
def add_one_row(root, val, depth)
    if depth == 1
        new_root = TreeNode.new(val)
        new_root.left = root
        return new_root
    end
    
    construct = lambda do |temp, count|
        return if temp.nil?
        if count == depth - 1
            new_left = TreeNode.new(val)
            new_left.left = temp.left
            temp.left = new_left
            
            new_right = TreeNode.new(val)
            new_right.right = temp.right
            temp.right = new_right
            return
        end
        construct.call(temp.left, count + 1)
        construct.call(temp.right, count + 1)
    end
    
    construct.call(root, 1)
    root
end
