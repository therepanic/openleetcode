class Solution:
    def maxProduct(self, root: Optional[TreeNode]) -> int:
        mod = 1_000_000_007
        nodes = []
        stack = [root]

        # Collect a parent-before-child order without relying on Python recursion.
        while stack:
            node = stack.pop()
            if node:
                nodes.append(node)
                stack.append(node.left)
                stack.append(node.right)

        sums = {}
        best = 0
        for node in reversed(nodes):
            subtotal = node.val + sums.get(node.left, 0) + sums.get(node.right, 0)
            sums[node] = subtotal

        total = sums[root]
        for subtotal in sums.values():
            best = max(best, subtotal * (total - subtotal))
        return best % mod
