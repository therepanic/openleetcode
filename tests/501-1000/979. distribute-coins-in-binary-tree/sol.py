# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from typing import Optional


class Solution:
    def distributeCoins(self, root: Optional[TreeNode]) -> int:
        self.moves = 0

        def solve(node):
            if not node:
                return 0

            left_candie = solve(node.left)
            right_candie = solve(node.right)

            self.moves += abs(left_candie) + abs(right_candie)

            return (left_candie + right_candie + node.val) - 1

        solve(root)
        return self.moves
