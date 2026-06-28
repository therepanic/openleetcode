class Solution(object):
    def getMinimumDifference(self, root):
        self.prev = None
        self.ans = float("inf")

        def dfs(node):
            if node:
                dfs(node.left)
                if self.prev is not None:
                    self.ans = min(self.ans, node.val - self.prev)
                self.prev = node.val
                dfs(node.right)

        dfs(root)
        return self.ans
