class Solution:
    def carPooling(self, trips: List[List[int]], capacity: int) -> bool:
        trips.sort(key=lambda x: x[1])
        heap = []
        current_passengers = 0
        for num, src, dest in trips:
            while heap and heap[0][0] <= src:
                current_passengers -= heapq.heappop(heap)[1]
            if current_passengers + num > capacity:
                return False
            current_passengers += num
            heapq.heappush(heap, (dest, num))
        return True
