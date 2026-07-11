from typing import List
from collections import deque


class Solution:
    def movesToStamp(self, stamp: str, target: str) -> List[int]:
        m, n = len(stamp), len(target)
        stamp = list(stamp)
        target = list(target)

        # Helper function to check if we can stamp at position i
        def can_stamp(i):
            for j in range(m):
                if target[i + j] != "?" and target[i + j] != stamp[j]:
                    return False
            return True

        # Helper function to apply stamp at position i
        def apply_stamp(i):
            for j in range(m):
                target[i + j] = "?"

        # Track visited positions and the stamping process
        stamped = [False] * n
        result = []
        queue = deque()

        # Initial queue fill
        for i in range(n - m + 1):
            if can_stamp(i):
                queue.append(i)
                apply_stamp(i)
                result.append(i)
                stamped[i] = True

        # Process the queue
        while queue:
            pos = queue.popleft()
            for i in range(max(0, pos - m + 1), min(n - m + 1, pos + m)):
                if can_stamp(i):
                    if not stamped[i]:
                        queue.append(i)
                        apply_stamp(i)
                        result.append(i)
                        stamped[i] = True

        # Verify that all characters in target are stamped
        if all(c == "?" for c in target):
            return result[::-1]
        else:
            return []
