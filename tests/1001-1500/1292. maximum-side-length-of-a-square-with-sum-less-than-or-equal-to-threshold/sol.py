class Solution:
    def isValid(self, pref, k, limit):
        n = len(pref)
        m = len(pref[0])

        for i in range(k - 1, n):
            for j in range(k - 1, m):
                x1 = i - k + 1
                y1 = j - k + 1

                total = pref[i][j]
                if x1 > 0:
                    total -= pref[x1 - 1][j]
                if y1 > 0:
                    total -= pref[i][y1 - 1]
                if x1 > 0 and y1 > 0:
                    total += pref[x1 - 1][y1 - 1]

                if total <= limit:
                    return True

        return False

    def maxSideLength(self, mat, threshold):
        n = len(mat)
        m = len(mat[0])

        pref = [row[:] for row in mat]

        # Row-wise prefix sum
        for i in range(n):
            for j in range(1, m):
                pref[i][j] += pref[i][j - 1]

        # Column-wise prefix sum
        for j in range(m):
            for i in range(1, n):
                pref[i][j] += pref[i - 1][j]

        low, high = 1, min(n, m)
        ans = 0

        while low <= high:
            mid = (low + high) // 2
            if self.isValid(pref, mid, threshold):
                ans = mid
                low = mid + 1
            else:
                high = mid - 1

        return ans
