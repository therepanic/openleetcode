# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def leafSimilar(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> bool:
        def helper(root, leaves):
            stack = [root]
            while stack:
                curr = stack.pop()
                if curr.left is None and curr.right is None:
                    leaves.append(curr.val)
                if curr.left:
                    stack.append(curr.left)
                if curr.right:
                    stack.append(curr.right)
            return leaves

        return helper(root1, []) == helper(root2, [])
