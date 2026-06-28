# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def addOneRow(
        self, root: Optional[TreeNode], val: int, depth: int
    ) -> Optional[TreeNode]:
        if depth == 1:
            newRoot = TreeNode(val)
            newRoot.left = root
            return newRoot

        def construct(temp, count):
            if not temp:
                return
            if count == depth - 1:
                newLeft = TreeNode(val)
                newLeft.left = temp.left
                temp.left = newLeft

                newRight = TreeNode(val)
                newRight.right = temp.right
                temp.right = newRight
                return
            construct(temp.left, count + 1)
            construct(temp.right, count + 1)

        construct(root, 1)
        return root
