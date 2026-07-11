# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from typing import Optional


class Solution:
    def rangeSumBST(self, root: Optional[TreeNode], low: int, high: int) -> int:
        res = 0

        def dfs(node):
            nonlocal res
            if not node:
                return
            dfs(node.left)
            if low <= node.val <= high:
                res += node.val
            dfs(node.right)

        dfs(root)
        return res
