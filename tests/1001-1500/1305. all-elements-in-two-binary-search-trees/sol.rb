# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Integer[]}
def get_all_elements(root1, root2)
    stack1, stack2, output = [], [], []
    
    while root1 || root2 || !stack1.empty? || !stack2.empty?
        while root1
            stack1.push(root1)
            root1 = root1.left
        end
        while root2
            stack2.push(root2)
            root2 = root2.left
        end

        if !stack1.empty? && !stack2.empty?
            if stack1[-1].val <= stack2[-1].val
                root1 = stack1.pop()
                output.push(root1.val)
                root1 = root1.right
            else
                root2 = stack2.pop()
                output.push(root2.val)
                root2 = root2.right
            end
        elsif stack1.empty?
            root2 = stack2.pop()
            output.push(root2.val)
            root2 = root2.right
        else
            root1 = stack1.pop()
            output.push(root1.val)
            root1 = root1.right
        end
    end

    output
end
