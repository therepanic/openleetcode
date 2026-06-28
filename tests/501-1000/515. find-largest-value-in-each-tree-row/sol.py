class Solution:
    def largestValues(self, root: Optional[TreeNode]) -> List[int]:

        def dfs(node, level):
            if not node:
                return

            if level == len(res):
                res.append(node.val)
            else:
                res[level] = max(res[level], node.val)

            dfs(node.left, level + 1)
            dfs(node.right, level + 1)

        res = []
        dfs(root, 0)

        return res
