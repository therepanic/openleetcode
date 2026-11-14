from collections import deque

class Solution(object):
    def maximumInvitations(self, favorite):
        n = len(favorite)
        in_deg = [0] * n
        chain_len = [0] * n
        visited = [False] * n
        q = deque()
        
        # Count how many people favor each employee
        for f in favorite:
            in_deg[f] += 1
        
        # Start with employees no one favorites (chain starters)
        for i in range(n):
            if in_deg[i] == 0:
                q.append(i)
        
        # Process chains to calculate max chain lengths
        while q:
            u = q.popleft()
            visited[u] = True
            v = favorite[u]
            chain_len[v] = max(chain_len[v], chain_len[u] + 1)
            in_deg[v] -= 1
            if in_deg[v] == 0:
                q.append(v)
        
        max_cycle, pair_chains = 0, 0
        
        # Detect cycles and calculate results
        for i in range(n):
            if visited[i]:
                continue
            cycle_len = 0
            current = i
            # Measure cycle length
            while not visited[current]:
                visited[current] = True
                current = favorite[current]
                cycle_len += 1
            if cycle_len == 2:  # Mutual pair
                pair_chains += 2 + chain_len[i] + chain_len[favorite[i]]
            else:
                max_cycle = max(max_cycle, cycle_len)
        
        return max(max_cycle, pair_chains)