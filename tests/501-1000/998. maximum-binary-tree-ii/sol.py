# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from typing import Optional


class Solution:
    def insertIntoMaxTree(
        self, root: Optional[TreeNode], val: int
    ) -> Optional[TreeNode]:

        def dfs(node):
            if not node:
                return TreeNode(val)
            if node.val > val:
                node.right = dfs(node.right)
                return node
            temp = TreeNode(val)
            temp.left = node
            return temp

        return dfs(root)
