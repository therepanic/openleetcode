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
# @return {TreeNode}
def insert_into_max_tree(root, val)
    dfs = lambda do |node|
        if node.nil?
            return TreeNode.new(val)
        end
        if node.val > val
            node.right = dfs.call(node.right)
            return node
        end
        temp = TreeNode.new(val)
        temp.left = node
        return temp
    end
    dfs.call(root)
end
