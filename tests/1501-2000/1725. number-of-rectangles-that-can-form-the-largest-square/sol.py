class Solution:
    def countGoodRectangles(self, rectangles: List[Tuple[int, int]]) -> int:
        max_len = max(min(rec) for rec in rectangles)
        return sum(int(min(rec) == max_len) for rec in rectangles)
