from collections import deque
from math import inf


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        idx, Sum = 0, -inf
        q = deque()
        q.append(root)
        level = 1
        while q:
            qz = len(q)
            curSum = 0
            for i in range(qz):
                Node = q.popleft()
                curSum += Node.val
                if Node.left:
                    q.append(Node.left)
                if Node.right:
                    q.append(Node.right)
            if curSum > Sum:
                idx, Sum = level, curSum
            level += 1
        return idx
