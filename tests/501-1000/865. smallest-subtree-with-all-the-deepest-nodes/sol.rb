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
# @return {TreeNode}
def subtree_with_all_deepest(root)
    return nil if root.nil?
    
    parent = {root => nil}
    q = [root]
    last_level = []
    
    while !q.empty?
        size = q.size
        last_level = []
        size.times do
            node = q.shift
            last_level << node
            if node.left
                parent[node.left] = node
                q << node.left
            end
            if node.right
                parent[node.right] = node
                q << node.right
            end
        end
    end
    
    deepest = last_level.to_set
    while deepest.size > 1
        deepest = deepest.map { |node| parent[node] }.to_set
    end
    
    return deepest.first
end
