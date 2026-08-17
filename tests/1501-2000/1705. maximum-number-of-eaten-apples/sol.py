class Solution:
    def eatenApples(self, apples: List[int], days: List[int]) -> int:
        heap = []
        n = len(apples)
        res = 0
        day = 0
        while heap or day < n:
            if day < n and apples[day] > 0:
                heapq.heappush(heap, (day + days[day], apples[day]))

            while heap and heap[0][0] <= day:
                heapq.heappop(heap)
            if heap:
                expire, count = heapq.heappop(heap)
                res += 1
                count -= 1
                if count > 0:
                    heapq.heappush(heap, (expire, count))
            day += 1

        return res
