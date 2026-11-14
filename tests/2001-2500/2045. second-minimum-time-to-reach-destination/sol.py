class Solution:
    def secondMinimum(self, n: int, edges: List[List[int]], time: int, change: int) -> int:
        # build neighbors map
        graph = [set() for _ in range(n + 1)]
        for x, y in edges:
            graph[x].add(y)
            graph[y].add(x)
        
        # find the shortest paths length
        curr = {1, }
        visited = set()
        answer = None
        l = 0
        while not answer: 
            nxt = set()
            for x in curr:  
                if x == n:
                    answer = l  # found destination, but not breaking a loop to find second minimum
                nxt |= graph[x] 
            nxt -= visited 

            visited |= curr  # add cities that we visited on previous step, not current one
            curr = nxt 
            l += 1
        
        if n in curr: # if we can reach destination on next move
            answer += 1
        else: # if not we just revisit a city once in the shortest path
            answer += 2
        
        # convert path length to time
        ttl = 0
        while answer:
            phase = ttl % (change * 2)
            if phase >= change:
                ttl += (2 * change - phase)
            ttl += time
            answer -= 1
        return ttl