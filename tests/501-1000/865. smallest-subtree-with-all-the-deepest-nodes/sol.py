from collections import deque


class Solution:
    def subtreeWithAllDeepest(self, root):
        if not root:
            return None

        parent = {root: None}
        q = deque([root])

        last_level = []

        # BFS traversal
        while q:
            size = len(q)
            last_level = []
            for _ in range(size):
                node = q.popleft()
                last_level.append(node)

                if node.left:
                    parent[node.left] = node
                    q.append(node.left)
                if node.right:
                    parent[node.right] = node
                    q.append(node.right)

        # last_level contains all deepest nodes
        deepest = set(last_level)

        # Move up until they meet
        while len(deepest) > 1:
            deepest = {parent[node] for node in deepest}

        return deepest.pop()
