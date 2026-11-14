from itertools import accumulate


class Solution:
    def subArrayRanges(self, a: List[int]) -> int:
        return sum(q for i in range(len(a)) 
            for q in map(sub,accumulate(a[i:],max),accumulate(a[i:],min)))
