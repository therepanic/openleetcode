from collections import deque
from typing import List


class Solution:
    def constrainedSubsetSum(self, nums: List[int], k: int) -> int:

        q = deque()
        res = float("-inf")

        for i, num in enumerate(nums):
            total = num + q[0][1] if q else num
            res = max(res, total)

            while q and total >= q[-1][1]:
                q.pop()

            if total > 0:
                q.append((i, total))

            if q and q[0][0] == i - k:
                q.popleft()

        return res
