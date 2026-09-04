from collections import deque

class Solution:
    def minimumTime(self, n: int,
                    relations: List[List[int]],
                    time: List[int]) -> int:

        ans = 0

        indegree = [0] * (n + 1)
        completionTime = [0] * (n + 1)

        adj = [[] for _ in range(n + 1)]

        # Build graph
        for u, v in relations:
            indegree[v] += 1
            adj[u].append(v)

        q = deque()

        # Push nodes having indegree 0
        for i in range(1, n + 1):
            if indegree[i] == 0:
                q.append(i)

        # Kahn's Algorithm + DP
        while q:
            node = q.popleft()

            for neigh in adj[node]:

                indegree[neigh] -= 1

                completionTime[neigh] = max(
                    completionTime[neigh],
                    completionTime[node] + time[node - 1]
                )

                if indegree[neigh] == 0:
                    q.append(neigh)

        # Final answer
        for i in range(1, n + 1):
            ans = max(ans,
                      completionTime[i] + time[i - 1])

        return ans