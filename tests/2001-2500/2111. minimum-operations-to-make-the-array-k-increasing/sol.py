class Solution:
    def kIncreasing(self, arr: List[int], k: int) -> int:

        n = len(arr)
        keep = 0

        for i in range(k):
            g = []
            for j in range(i, n, k):
                x = arr[j]
                idx = bisect_right(g, x)
                if idx == len(g):
                    g.append(x)
                else:
                    g[idx] = x
            keep += len(g)

        return n - keep