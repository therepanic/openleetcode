class Solution:
    def minDeletionSize(self, strs):
        n, m = len(strs), len(strs[0])
        sorted_pairs = [False] * (n - 1)
        delCount = 0

        for col in range(m):
            bad = False
            for i in range(n - 1):
                if not sorted_pairs[i] and strs[i][col] > strs[i + 1][col]:
                    bad = True
                    break

            if bad:
                delCount += 1
                continue

            for i in range(n - 1):
                if not sorted_pairs[i] and strs[i][col] < strs[i + 1][col]:
                    sorted_pairs[i] = True

            if all(sorted_pairs):
                break

        return delCount
