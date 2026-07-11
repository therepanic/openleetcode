from typing import List


class Solution:
    def sumEvenAfterQueries(
        self, nums: List[int], queries: List[List[int]]
    ) -> List[int]:
        total = sum(x for x in nums if x % 2 == 0)
        ans = []
        for val, idx in queries:
            if nums[idx] % 2 == 0:
                total -= nums[idx]
            nums[idx] += val
            if nums[idx] % 2 == 0:
                total += nums[idx]
            ans.append(total)
        return ans
