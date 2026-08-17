class Solution:
    def splitPainting(self, segments: List[List[int]]) -> List[List[int]]:
        seg = segments
        size: int = len(seg)

        events: list[tuple[int, int]] = []

        for i in range(0, size):
            start: int = seg[i][0]
            end: int = seg[i][1]
            color: int = seg[i][2]

            events.append((start, color))
            events.append((end, -1 * color))

        events.sort()

        prev: int = -1
        ans: list[tuple[int, int, int]] = []
        mix_color: int = 0

        for i in range(0, len(events)):
            if prev != -1:
                if events[i][0] != prev and mix_color != 0:
                    ans.append((prev, events[i][0], mix_color))

            prev = events[i][0]
            mix_color += events[i][1]

        return ans
