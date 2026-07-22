from typing import List


class Solution:
    def findMaxValueOfEquation(self, points: List[List[int]], k: int) -> int:
        from collections import deque

        window = deque()
        answer = -(10**30)
        for x, y in points:
            while window and x - window[0][1] > k:
                window.popleft()
            if window:
                answer = max(answer, x + y + window[0][0])
            value = y - x
            while window and window[-1][0] <= value:
                window.pop()
            window.append((value, x))
        return answer
