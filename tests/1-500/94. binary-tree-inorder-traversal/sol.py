# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def inorderTraversal(self, root):
        ans = []

        def traveral(curr):
            if not curr:
                return
            traveral(curr.left)
            ans.append(curr.val)
            traveral(curr.right)

        traveral(root)
        return ans