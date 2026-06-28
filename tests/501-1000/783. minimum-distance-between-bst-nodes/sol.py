# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        prev, minDiff = None, float("inf")

        def inorder(root):
            nonlocal prev, minDiff
            if not root:
                return
            inorder(root.left)
            if prev is not None:
                diff = root.val - prev
                if diff < minDiff:
                    minDiff = diff
            prev = root.val
            inorder(root.right)
            return minDiff

        return inorder(root)
