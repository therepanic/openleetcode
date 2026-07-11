from collections import deque
from typing import Optional


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def isCompleteTree(self, root):
        q = deque([root])
        past = False
        while q:
            rv = q.popleft()
            if not rv:
                past = True
            else:
                if past:
                    return False
                q.append(rv.left)
                q.append(rv.right)
        return True
