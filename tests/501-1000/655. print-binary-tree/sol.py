# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def find_height(self, node):
        if node is None:
            return 0

        height = 0
        if node.left:
            height = max(height, 1 + self.find_height(node.left))
        if node.right:
            height = max(height, 1 + self.find_height(node.right))

        return height

    def printTree(self, root: Optional[TreeNode]) -> List[List[str]]:
        # number of rows: m = height + 1
        # number of cols: n = 2 ^ (height + 1) - 1
        # find the height (DFS)
        height = self.find_height(root)
        m = height + 1
        n = 2 ** (height + 1) - 1

        # construct result matrix
        matrix = [["" for _ in range(n)] for _ in range(m)]

        # BFS (level order traversal) to place nodes in matrix
        # node, x, y
        # root at [0][(n - 1)/2]
        queue = deque([(root, 0, (n - 1) // 2)])
        depth = 0
        while queue:
            level_size = len(queue)
            for _ in range(level_size):
                front = queue.popleft()
                front_node = front[0]
                x = front[1]
                y = front[2]
                matrix[x][y] = str(front_node.val)
                # left child at res[r+1][c-2^(height-r-1)]
                if front_node.left:
                    queue.append((front_node.left, x + 1, y - 2 ** (height - x - 1)))

                # right child at res[r+1][c+2^(height-r-1)]
                if front_node.right:
                    queue.append((front_node.right, x + 1, y + 2 ** (height - x - 1)))

        return matrix
