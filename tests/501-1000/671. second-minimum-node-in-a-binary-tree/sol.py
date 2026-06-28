# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findSecondMinimumValue(self, root: Optional[TreeNode]) -> int:
        first = root.val
        second = float("inf")

        def dfs(root):
            nonlocal second
            if root is None:
                return
            if first < root.val < second:
                second = root.val
            dfs(root.left)
            dfs(root.right)

        dfs(root)
        return second if second != float("inf") else -1
