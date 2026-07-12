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
# @return {Integer[][]}
def vertical_traversal(root)
    nodes = []
    
    dfs = lambda do |node, row, col|
        return if node.nil?
        nodes << [col, row, node.val]
        dfs.call(node.left, row + 1, col - 1)
        dfs.call(node.right, row + 1, col + 1)
    end
    
    dfs.call(root, 0, 0)
    nodes.sort!
    
    res = []
    prev_col = -Float::INFINITY
    
    nodes.each do |col, row, val|
        if col != prev_col
            res << []
            prev_col = col
        end
        res[-1] << val
    end
    
    res
end
