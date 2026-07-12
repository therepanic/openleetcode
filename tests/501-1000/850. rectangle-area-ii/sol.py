class Solution:
    def rectangleArea(self, rectangles: List[List[int]]) -> int:
        OPEN, CLOSE = 0, 1
        events = sorted(
            (*p, x1, x2)
            for x1, y1, x2, y2 in rectangles
            for p in ((y1, OPEN), (y2, CLOSE))
        )
        res, cur_y, active = 0, events[0][0], SortedList()
        for y, typ, x1, x2 in events:
            q, cur = 0, -1
            for ax1, ax2 in active:
                q, cur = q + max(0, ax2 - max(cur, ax1)), max(cur, ax2)

            res, cur_y = res + q * (y - cur_y), y
            (active.remove, active.add)[typ is OPEN]((x1, x2))

        return res % (10**9 + 7)
