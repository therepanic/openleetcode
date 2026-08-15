import heapq


class Solution:
    def minInterval(self, intervals: List[List[int]], queries: List[int]) -> List[int]:
        # Sort the intervals
        intervals.sort()

        # Initialize minHeap = [], res = {} and index i = 0.
        minHeap = []
        res = {}
        i = 0

        # Iterate for q in sorted(queries)
        for q in sorted(queries):
            # Iterate while i < len(intervals) and intervals[i][0] <= q
            while i < len(intervals) and intervals[i][0] <= q:
                # Initialize l, r to values of intervals[i]
                l, r = intervals[i]
                # Push (r - l + 1, r) which is (size, right interval) to minHeap
                heapq.heappush(minHeap, (r - l + 1, r))
                # Update i pointer to +1
                i += 1

            # Iterate while minHeap and minHeap[0][1] < q
            while minHeap and minHeap[0][1] < q:
                # Pop from minHeap
                heapq.heappop(minHeap)
            # Update res[q] = minHeap[0][0] if minHeap else -1
            res[q] = minHeap[0][0] if minHeap else -1

        # Iterate for i in range(len(queries))
        for i in range(len(queries)):
            # Update queries[i] = res[queries[i]]
            queries[i] = res[queries[i]]

        # return queries
        return queries
