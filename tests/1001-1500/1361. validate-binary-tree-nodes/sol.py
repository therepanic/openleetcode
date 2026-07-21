from collections import deque
from typing import List


class Solution:
    def validateBinaryTreeNodes(
        self, n: int, leftChild: list[int], rightChild: list[int]
    ) -> bool:
        in_degree = [0] * n
        for i in range(n):
            for child in (leftChild[i], rightChild[i]):
                if child != -1:
                    if child < 0 or child >= n:
                        return False
                    in_degree[child] += 1
                    if in_degree[child] > 1:
                        return False

        root = -1
        for i, x in enumerate(in_degree):
            if x == 0:
                if root != -1:
                    return False
                root = i
        if root == -1:
            return False

        queue = deque([root])
        visited = {root}

        while queue:
            node = queue.popleft()
            for child in [leftChild[node], rightChild[node]]:
                if child == -1:
                    continue
                if child in visited:
                    return False
                visited.add(child)
                queue.append(child)
        return len(visited) == n
