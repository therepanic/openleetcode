# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        def validate(node, min_val, max_val):
            if not node:
                return True
            if not (min_val < node.val < max_val):
                return False

            return validate(node.left, min_val, node.val) and validate(
                node.right, node.val, max_val
            )

        return validate(root, float("-inf"), float("inf"))
