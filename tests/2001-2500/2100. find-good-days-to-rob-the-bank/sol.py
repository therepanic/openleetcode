from itertools import accumulate, pairwise


class Solution:
    def goodDaysToRobBank(self, a: List[int], t: int) -> List[int]:
        f = lambda a:[*accumulate(pairwise(a),lambda q,p:(q+1)*ge(*p),initial=0)]
        l, r = f(a), f(a[::-1])[::-1]
        return [i for i in range(len(a)) if l[i]>=t<=r[i]]
