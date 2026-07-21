# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def removeLeafNodes(
        self, root: Optional[TreeNode], target: int
    ) -> Optional[TreeNode]:
        def traverseAndRemove(temp):
            if not temp:
                return
            if not temp.left and not temp.right:
                if temp.val == target:
                    return False
                else:
                    return True
            left = traverseAndRemove(temp.left)
            right = traverseAndRemove(temp.right)
            if not left:
                temp.left = None
            if not right:
                temp.right = None
            return left or right or temp.val != target

        if not traverseAndRemove(root):
            return
        return root
