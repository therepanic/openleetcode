# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from typing import Optional


class Solution:
    def isCousins(self, root: Optional[TreeNode], x: int, y: int) -> bool:
        res = []
        stack = [(root, None, 0)]
        while stack:
            curr, parent, depth = stack.pop()
            if curr.val == x or curr.val == y:
                res.append((parent, depth))
            if curr.left:
                stack.append((curr.left, curr, depth + 1))
            if curr.right:
                stack.append((curr.right, curr, depth + 1))
        return len(res) == 2 and res[0][1] == res[1][1] and res[0][0] != res[1][0]
