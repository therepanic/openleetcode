import heapq


class Solution:
    def scheduleCourse(self, courses: List[List[int]]) -> int:
        courses.sort(key=lambda x: (x[1], x[0]))
        heap = []
        days = 0
        cnt = 0
        for duration, last in courses:
            days += duration
            heapq.heappush(heap, -duration)
            if days > last:
                top = heapq.heappop(heap)
                days += top
        return len(heap)
