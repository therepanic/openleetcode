# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countPairs(self, root: Optional[TreeNode], distance: int) -> int:

        self.ans = 0

        graph = defaultdict(list)

        def dfs(node, parent):
            nonlocal graph

            if not node:
                return None

            if parent:
                graph[parent].append(node)
                graph[node].append(parent)

            dfs(node.left, node)
            dfs(node.right, node)

        dfs(root, None)

        leaves = [node for node in graph if not node.left and not node.right]
        ans = 0

        for i, leaf in enumerate(leaves):
            q = deque([(leaf, 0)])
            visited = set([leaf])

            while q:
                node, dist = q.popleft()
                if dist >= distance:
                    continue
                for nei in graph[node]:
                    if nei not in visited:
                        visited.add(nei)
                        q.append((nei, dist + 1))
                        if nei in leaves and leaves.index(nei) > i:
                            ans += 1

        return ans
