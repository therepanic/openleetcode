class Solution(object):
    def assignTasks(self, servers, tasks):
        """
        :type servers: List[int]
        :type tasks: List[int]
        :rtype: List[int]
        """
        n = len(servers)
        m = len(tasks)

        available = [(servers[i], i) for i in range(n)]
        heapq.heapify(available)

        busy = []
        ans = []
        time = 0

        for i in range(m):
            time = max(time, i)
            while busy and busy[0][0] <= time:
                free_time, weight, idx = heapq.heappop(busy)
                heapq.heappush(available, (weight, idx))

            if not available:
                time = busy[0][0]
                while busy and busy[0][0] <= time:
                    free_time, weight, idx = heapq.heappop(busy)
                    heapq.heappush(available, (weight, idx))

            weight, idx = heapq.heappop(available)
            heapq.heappush(busy, (time + tasks[i], weight, idx))
            ans.append(idx)

        return ans
