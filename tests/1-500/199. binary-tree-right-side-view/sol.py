from typing import List, Optional

from collections import deque


class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        if root is None:
            return []

        result = []
        queue = deque([root])
        while queue:
            rightmost = None
            for _ in range(len(queue)):
                node = queue.popleft()
                rightmost = node.val
                if node.left is not None:
                    queue.append(node.left)
                if node.right is not None:
                    queue.append(node.right)
            result.append(rightmost)
        return result
