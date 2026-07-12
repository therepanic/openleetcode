# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {String} traversal
# @return {TreeNode}
def recover_from_preorder(traversal)
    stack = []
    i = 0
    n = traversal.length
    while i < n
        depth = 0
        while i < n && traversal[i] == '-'
            depth += 1
            i += 1
        end
        val = 0
        while i < n && traversal[i] >= '0' && traversal[i] <= '9'
            val = val * 10 + traversal[i].ord - 48
            i += 1
        end
        node = TreeNode.new(val)
        stack.pop while stack.length > depth
        if !stack.empty?
            parent = stack[-1]
            if parent.left.nil?
                parent.left = node
            else
                parent.right = node
            end
        end
        stack << node
    end
    stack[0]
end
