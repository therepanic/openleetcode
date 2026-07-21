from collections import Counter
from typing import List


class Solution:
    def isPossibleDivide(self, nums: List[int], k: int) -> bool:
        if len(nums) % k != 0:
            return False
        count = Counter(nums)
        nums.sort()
        for num in nums:
            if count[num] == 0:
                continue
            for i in range(k):
                if count[num + i] == 0:
                    return False
                count[num + i] -= 1
        return True
