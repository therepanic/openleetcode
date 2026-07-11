# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from typing import List, Optional


class Solution:
    def flipMatchVoyage(self, root: Optional[TreeNode], voyage: List[int]) -> List[int]:
        flipped_nodes = []

        idx = 0

        def dfs(node):
            nonlocal idx
            if node.val != voyage[idx]:
                # impossible
                return False

            idx += 1
            if node.left and node.right:
                # two children exist
                if voyage[idx] == node.right.val:
                    # flip needed
                    flipped_nodes.append(node.val)
                    if not dfs(node.right):
                        return False
                    if not dfs(node.left):
                        return False
                elif voyage[idx] == node.left.val:
                    # no flip needed
                    if not dfs(node.left):
                        return False
                    if not dfs(node.right):
                        return False
                else:
                    # neither matched
                    return False
            else:
                # only 1 or no child
                if node.left:
                    if not dfs(node.left):
                        return False
                elif node.right:
                    if not dfs(node.right):
                        return False

            return True

        if not dfs(root):
            return [-1]

        return flipped_nodes
