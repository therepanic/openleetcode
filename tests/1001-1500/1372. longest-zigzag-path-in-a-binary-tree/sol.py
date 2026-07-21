# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def longestZigZag(self, root: TreeNode) -> int:
        if root is None:
            return 0

        # Store the best alternating path ending at each node by final direction.
        best = 0
        stack = [
            (root, 0, 0)
        ]  # node, path ending with left edge, path ending with right edge
        while stack:
            node, ended_left, ended_right = stack.pop()
            best = max(best, ended_left, ended_right)
            if node.left:
                stack.append((node.left, ended_right + 1, 0))
            if node.right:
                stack.append((node.right, 0, ended_left + 1))
        return best
