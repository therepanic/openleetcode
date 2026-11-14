class Solution:
    def maximalPathQuality(self, values: List[int], edges: List[List[int]], maxTime: int) -> int:

        def dfs(node:int, prev_qual:int, prev_time:int, prev_mask:int)-> None:
            
            if node == 0: 
                self.maxQuality = max(self.maxQuality, prev_qual)
                
            for nxt, wgt in graph[node]:
                if wgt > prev_time: continue

                if prev_mask & (1<< nxt): qual = prev_qual
                else: qual = prev_qual + values[nxt]

                mask = prev_mask | (1<< nxt)
                time = prev_time - wgt

                dfs(nxt, qual, time, mask)

            return


        self.maxQuality = 0
        graph = defaultdict(list)

        for u, v, wgt in edges:
            graph[u].append((v, wgt))
            graph[v].append((u, wgt))
        
        dfs(0, values[0], maxTime, 1)
        return self.maxQuality