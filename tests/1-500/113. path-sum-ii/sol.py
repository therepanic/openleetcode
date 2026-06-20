from typing import List, Optional


class Solution:
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> List[List[int]]:
        result = []

        def dfs(node: Optional[TreeNode], remaining: int, path: List[int]) -> None:
            if node is None:
                return
            path.append(node.val)
            remaining -= node.val
            if node.left is None and node.right is None and remaining == 0:
                result.append(path[:])
            else:
                dfs(node.left, remaining, path)
                dfs(node.right, remaining, path)
            path.pop()

        dfs(root, targetSum, [])
        return result
