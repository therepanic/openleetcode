from collections import deque

class Solution:
    def canMeasureWater(self, x, y, target):
        if target > x + y:
            return False

        stack = [(0, 0)]
        visited = set()

        while stack:
            a, b = stack.pop()

            if a + b == target:
                return True

            if (a, b) in visited:
                continue
            visited.add((a, b))

            stack.extend([(x, b), (a, y), (0, b), (a, 0)])

            w = min(a, y - b)
            stack.append((a - w, b + w))

            w = min(b, x - a)
            stack.append((a + w, b - w))

        return False