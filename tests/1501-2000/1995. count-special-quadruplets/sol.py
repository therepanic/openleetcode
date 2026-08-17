class Solution:
    def countQuadruplets(self, nums: List[int]) -> int:
        A = nums
        res, n = 0, len(A)
        for w in range(n):
            for x in range(w + 1, n):
                for y in range(x + 1, n):
                    for z in range(y + 1, n):
                        res += int(A[w] + A[x] + A[y] == A[z])
        return res
