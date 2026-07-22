# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None


class Solution:
    def getAllElements(self, root1: TreeNode, root2: TreeNode) -> List[int]:
        stack1, stack2, output = [], [], []

        while root1 or root2 or stack1 or stack2:
            # update both stacks
            # by going left till possible
            while root1:
                stack1.append(root1)
                root1 = root1.left
            while root2:
                stack2.append(root2)
                root2 = root2.left

            # Add the smallest value into output,
            # pop it from the stack,
            # and then do one step right
            if stack2 and stack1:
                if stack1[-1].val <= stack2[-1].val:
                    root1 = stack1.pop()
                    output.append(root1.val)
                    root1 = root1.right
                else:
                    root2 = stack2.pop()
                    output.append(root2.val)
                    root2 = root2.right

            elif not stack1:
                root2 = stack2.pop()
                output.append(root2.val)
                root2 = root2.right
            else:
                root1 = stack1.pop()
                output.append(root1.val)
                root1 = root1.right

        return output
