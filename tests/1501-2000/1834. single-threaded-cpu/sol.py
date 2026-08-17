import heapq
from typing import List


class Solution:
    def getOrder(self, tasks: List[List[int]]) -> List[int]:
        n = len(tasks)

        # Store (enqueueTime, processingTime, originalIndex)
        indexed_tasks = [(tasks[i][0], tasks[i][1], i) for i in range(n)]

        # Sort by enqueue time
        indexed_tasks.sort()

        result = []
        heap = []

        time = 0
        i = 0

        while i < n or heap:
            # If no task is available, jump to the next enqueue time
            if not heap and time < indexed_tasks[i][0]:
                time = indexed_tasks[i][0]

            # Add all tasks that have become available
            while i < n and indexed_tasks[i][0] <= time:
                enqueue, process, index = indexed_tasks[i]
                heapq.heappush(heap, (process, index))
                i += 1

            # Process the task with smallest processing time
            process, index = heapq.heappop(heap)
            result.append(index)
            time += process

        return result
