import heapq


class Solution:
    def isPossible(self, target: List[int]) -> bool:
        total = sum(target)
        heap = [-value for value in target]
        heapq.heapify(heap)

        while True:
            largest = -heapq.heappop(heap)
            rest = total - largest
            if largest == 1 or rest == 1:
                return True
            if rest == 0 or rest >= largest:
                return False

            previous = largest % rest
            if previous == 0:
                return False

            total = rest + previous
            heapq.heappush(heap, -previous)
