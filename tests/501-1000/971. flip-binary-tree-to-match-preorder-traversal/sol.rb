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
# @param {Integer[]} voyage
# @return {Integer[]}
def flip_match_voyage(root, voyage)
    flipped_nodes = []
    @idx = 0
    
    dfs = lambda do |node|
        return true if node.nil?
        return false if node.val != voyage[@idx]
        
        @idx += 1
        if node.left && node.right
            if voyage[@idx] == node.right.val
                flipped_nodes << node.val
                return false unless dfs.call(node.right)
                return false unless dfs.call(node.left)
            elsif voyage[@idx] == node.left.val
                return false unless dfs.call(node.left)
                return false unless dfs.call(node.right)
            else
                return false
            end
        else
            if node.left
                return false unless dfs.call(node.left)
            elsif node.right
                return false unless dfs.call(node.right)
            end
        end
        true
    end
    
    return [-1] unless dfs.call(root)
    flipped_nodes
end
