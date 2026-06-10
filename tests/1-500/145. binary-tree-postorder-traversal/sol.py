from typing import List, Optional


class Solution:
    def postorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        result = []
        stack = [(root, False)] if root is not None else []
        while stack:
            node, visited = stack.pop()
            if visited:
                result.append(node.val)
                continue
            stack.append((node, True))
            if node.right is not None:
                stack.append((node.right, False))
            if node.left is not None:
                stack.append((node.left, False))
        return result
