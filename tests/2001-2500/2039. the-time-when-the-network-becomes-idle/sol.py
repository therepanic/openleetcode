class Solution(object):
    def networkBecomesIdle(self, edges, patience):
        """
        :type edges: List[List[int]]
        :type patience: List[int]
        :rtype: int
        """
        n = len(patience)
        
        graph = defaultdict(list)
        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)
        
        dist = [float('inf')] * n
        dist[0] = 0
        queue = deque([0])
        
        while queue:
            u = queue.popleft()
            for v in graph[u]:
                if dist[v] == float('inf'):
                    dist[v] = dist[u] + 1
                    queue.append(v)
        
        max_time = 0
        for i in range(1, n):
            rtt = 2 * dist[i]
            if patience[i] >= rtt:
                last_reply = rtt
            else:
                last_send = ((rtt - 1) // patience[i]) * patience[i]
                last_reply = last_send + rtt
            max_time = max(max_time, last_reply)
        
        return max_time + 1