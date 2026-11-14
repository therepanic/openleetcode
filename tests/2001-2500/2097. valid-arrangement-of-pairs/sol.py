import collections

class Solution:
    def validArrangement(self, pairs: List[List[int]]) -> List[List[int]]:
        # 1. Coordinate Mapping (Numerical State-Space)
        adj = collections.defaultdict(list)
        in_degree = collections.defaultdict(int)
        out_degree = collections.defaultdict(int)
        
        for u, v in pairs:
            adj[u].append(v)
            out_degree[u] += 1
            in_degree[v] += 1
            
        # 2. Find the Root (The Source of the Flow)
        # In a valid arrangement, the start node has out_degree = in_degree + 1
        start_node = pairs[0][0]
        for node in out_degree:
            if out_degree[node] > in_degree[node]:
                start_node = node
                break
        
        # 3. Draining the Matrix (Hierholzer's via Spanning Tree logic)
        res = []
        stack = [start_node]
        
        while stack:
            while adj[stack[-1]]:
                # We drain the 'out-degree' flow
                stack.append(adj[stack[-1]].pop())
            res.append(stack.pop())
            
        # 4. Reconstructing the Pairs
        res.reverse()
        return [[res[i], res[i+1]] for i in range(len(res) - 1)]