from collections import defaultdict
from typing import List


class Solution:
    def subarraysDivByK(self, nums: List[int], k: int) -> int:

        s = 0
        res = 0
        hs = defaultdict(int)
        hs[0] = 1  # Base case: remainder 0 seen once (before array starts)

        for num in nums:
            s += num
            rem = s % k  # Python % is always non-negative — safe for negatives

            res += hs[rem]  # All previous indices with same remainder = valid subarrays
            hs[rem] += 1  # Record current remainder frequency

        return res
