from typing import Optional

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right


class Solution:
    def increasingBST(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        self.vals = []

        # Store inorder traversal
        self.inord(root)

        # Create increasing order BST
        root = self.create(self.vals, 0)

        return root

    def create(self, vals, i):
        if i >= len(vals):
            return None

        root = TreeNode(vals[i])
        root.right = self.create(vals, i + 1)

        return root

    def inord(self, root):
        if not root:
            return

        self.inord(root.left)
        self.vals.append(root.val)
        self.inord(root.right)
