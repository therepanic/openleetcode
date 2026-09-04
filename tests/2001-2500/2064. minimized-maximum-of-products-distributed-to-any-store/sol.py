class Solution:
    def minimizedMaximum(self, n: int, q: List[int]) -> int:
        return bisect_left(range(max(q)),0,1,key=lambda x:sum(-v//x for v in q)+n)