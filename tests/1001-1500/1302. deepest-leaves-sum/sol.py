import collections
from typing import Optional


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def deepestLeavesSum(self, root: Optional[TreeNode]) -> int:

        leaves = collections.Counter()

        def dfs(node, depth):

            if not node:
                return

            if not node.left and not node.right:
                leaves[depth] += node.val

            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)

        dfs(root, 0)

        max_depth = max(leaves.keys())

        return leaves[max_depth]
