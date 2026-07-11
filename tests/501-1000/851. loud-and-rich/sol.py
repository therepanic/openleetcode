class Solution:
    def loudAndRich(self, richer: List[List[int]], quiet: List[int]) -> List[int]:
        # build the graph
        graph = defaultdict(list)
        # include itself and richer person
        for a, b in richer:
            graph[b].append(a)
        n = len(quiet)
        answer = [-1] * n

        def dfs(i):
            if answer[i] != -1:
                return answer[i]
            # assign with self first
            answer[i] = i

            for nei in graph[i]:
                item = dfs(nei)
                # check neighbor's quietness
                if quiet[item] < quiet[answer[i]]:
                    # index needs to be stored
                    answer[i] = item
            return answer[i]

        # lets process every node
        for i in range(n):
            val = dfs(i)

        return answer
