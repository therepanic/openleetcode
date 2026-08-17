class Solution:
    def countPairs(
        self, n: int, edges: List[List[int]], queries: List[int]
    ) -> List[int]:

        x = defaultdict(set)
        edge = [0] * n
        edge_pair = defaultdict(int)

        for i, j in edges:
            x[i - 1].add(j - 1)
            x[j - 1].add(i - 1)
            edge[i - 1] += 1
            edge[j - 1] += 1
            edge_pair[i - 1, j - 1] += 1
            edge_pair[j - 1, i - 1] += 1

        res = sorted(edge)

        def binse(threshold):
            i = 0
            j = n - 1
            ans = n
            while i <= j:
                mid = (i + j) // 2
                if res[mid] > threshold:
                    ans = mid
                    j = mid - 1
                else:
                    i = mid + 1

            return n - ans

        def f(i):

            v.add(i)
            a = binse(query - edge[i])

            if edge[i] > query - edge[i]:
                a -= 1

            # print(query, i, a, edge[i])

            for j in x[i]:
                if (
                    edge[j] > query - edge[i]
                    and edge[j] - edge_pair[i, j] <= query - edge[i]
                ):
                    a -= 1

                if j not in v:
                    f(j)
            nonlocal ans
            ans += a

        final_result = []

        for query in queries:
            v = set()
            ans = 0

            for j in range(n):
                if j not in v:
                    f(j)

            final_result.append(ans // 2)

        return final_result
