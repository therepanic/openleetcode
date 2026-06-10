from typing import Optional


class Solution:
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        def dfs(node: Optional[TreeNode], current: int) -> int:
            if node is None:
                return 0
            current = current * 10 + node.val
            if node.left is None and node.right is None:
                return current
            return dfs(node.left, current) + dfs(node.right, current)

        return dfs(root, 0)
