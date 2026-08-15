class Solution:
    def closestToTarget(self, arr: List[int], target: int) -> int:
        n = len(arr)
        LOG = math.floor(math.log2(n)) + 1
        st = [[0] * LOG for _ in range(n)]
        for i in range(n):
            st[i][0] = arr[i]
        for j in range(1, LOG):
            for i in range(n - (1 << j) + 1):
                st[i][j] = st[i][j - 1] & st[i + (1 << (j - 1))][j - 1]
        logs = [0] * (n + 1)
        for i in range(2, n + 1):
            logs[i] = logs[i // 2] + 1

        def query(l, r):
            k = logs[r - l + 1]
            return st[l][k] & st[r - (1 << k) + 1][k]

        res = float("inf")
        for l in range(n):
            L, R = l, n - 1
            while L <= R:
                mid = (L + R) // 2
                val = query(l, mid)
                res = min(res, abs(val - target))
                if val >= target:
                    L = mid + 1
                else:
                    R = mid - 1
        return res
