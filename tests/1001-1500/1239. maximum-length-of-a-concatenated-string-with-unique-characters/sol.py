class Solution:
    def maxLength(self, arr: List[str]) -> int:
        n = len(arr)
        ans = 0

        def dfs(i, path):
            nonlocal ans
            ans = max(ans, len(path))
            for j in range(i, n):
                if len(set(arr[j])) != len(arr[j]) or set(path) & set(arr[j]):
                    continue
                dfs(j + 1, path + arr[j])

        dfs(0, "")
        return ans
