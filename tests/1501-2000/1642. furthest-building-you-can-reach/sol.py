class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        heap = []
        n = len(heights)
        for i in range(1, n):
            climb = heights[i] - heights[i - 1]
            if climb <= 0:
                continue
            heapq.heappush(heap, climb)
            if len(heap) > ladders:
                diff = heapq.heappop(heap)
                if bricks >= diff:
                    bricks -= diff
                else:
                    return i - 1
        return n - 1
