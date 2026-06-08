class Solution:
    def getPermutation(self, n, k):
        nums = []
        factorial = [1] * (n + 1)

        for i in range(1, n + 1):
            nums.append(str(i))
            factorial[i] = factorial[i - 1] * i

        k -= 1
        res = []
        for remaining in range(n, 0, -1):
            block = factorial[remaining - 1]
            idx = k // block
            k %= block
            res.append(nums.pop(idx))

        return "".join(res)
