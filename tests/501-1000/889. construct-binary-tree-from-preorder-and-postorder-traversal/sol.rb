# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} postorder
# @return {TreeNode}
def construct_from_pre_post(preorder, postorder)
    index = [0]
    return construct_helper(preorder, postorder, index, 0, preorder.length - 1)
end

def construct_helper(pre, post, index, l, h)
    if index[0] >= pre.length || l > h
        return nil
    end
    
    root = TreeNode.new(pre[index[0]])
    index[0] += 1
    if l == h
        return root
    end
    
    i = l
    while i <= h && post[i] != pre[index[0]]
        i += 1
    end
    
    if i <= h
        root.left = construct_helper(pre, post, index, l, i)
        root.right = construct_helper(pre, post, index, i + 1, h - 1)
    end
    
    return root
end
