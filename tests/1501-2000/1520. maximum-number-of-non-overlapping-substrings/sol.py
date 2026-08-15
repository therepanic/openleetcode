from collections import Counter, deque
from math import inf
from typing import List


class Solution:
    def maxNumOfSubstrings(self, s: str) -> List[str]:
        n = len(s)
        counts = Counter(s)
        first = {k: s.find(k) for k in counts}
        last = {k: s.rfind(k) for k in counts}

        res = []
        queue = deque()

        for k in counts:
            queue.appendleft([first[k], last[k], counts[k]])
            left, right, total = inf, -inf, 0

            for x, y, z in queue:
                total += z
                left = min(left, x)
                right = max(right, y)
                if total == right - left + 1:
                    break

            if total == right - left + 1:
                res.append(s[left : right + 1])
                queue = deque()

        return res
