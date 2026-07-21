from itertools import pairwise


class Solution:
    def minimumAbsDifference(self, arr: List[int]) -> List[List[int]]:
        arr.sort()
        minD = min(y - x for x, y in pairwise(arr))
        return [[x, y] for x, y in pairwise(arr) if y - x == minD]
