from collections import deque


class Solution(object):
    def checkIfPrerequisite(self, numCourses, prerequisites, queries):
        adj = [[] for _ in range(numCourses)]
        prereq = [0] * numCourses  # Bitmask for prerequisites
        in_degree = [0] * numCourses

        # Build graph and initialize direct prerequisites
        for a, b in prerequisites:
            adj[a].append(b)
            prereq[b] |= 1 << a  # Set the a-th bit for course b
            in_degree[b] += 1

        # Topological sort using Kahn's algorithm
        q = deque()
        for i in range(numCourses):
            if in_degree[i] == 0:
                q.append(i)

        while q:
            u = q.popleft()
            for v in adj[u]:
                prereq[v] |= prereq[u]  # Merge u's prerequisites into v's
                in_degree[v] -= 1
                if in_degree[v] == 0:
                    q.append(v)

        # Answer queries using bitmask checks
        ans = []
        for u, v in queries:
            ans.append((prereq[v] & (1 << u)) != 0)
        return ans
