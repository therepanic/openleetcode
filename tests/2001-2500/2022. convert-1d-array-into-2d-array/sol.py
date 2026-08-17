class Solution:
    def construct2DArray(self, original, m, n):
        k = len(original)
        if m * n != k:
            return []
        ans = []
        idx = 0
        while idx < k:
            temp = []
            for _ in range(n):
                temp.append(original[idx])
                idx += 1
            ans.append(temp)
        return ans
