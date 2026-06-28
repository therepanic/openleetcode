# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def widthOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        q = deque([root])
        ind = deque([0])
        res = []
        while q:
            l = []
            for _ in range(len(q)):
                node = q.popleft()
                i = ind.popleft()
                if node:
                    l.append(i)
                    if node.left:
                        q.append(node.left)
                        ind.append(2 * i + 1)
                    if node.right:
                        q.append(node.right)
                        ind.append(2 * i + 2)
                else:
                    ind.append(2 * i + 1)
                    ind.append(2 * i + 2)
            res.append(l)
        max_width = 0
        for r in res:
            if len(r) >= 1:
                width = r[-1] - r[0] + 1
                max_width = max(max_width, width)
        return max_width
