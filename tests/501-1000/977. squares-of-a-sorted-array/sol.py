from typing import List


class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:

        newarr = []
        for i in nums:
            newarr.append(i * i)
        newarr.sort()
        return newarr
