class Solution:
    def kConcatenationMaxSum(self, arr: List[int], k: int) -> int:
        MOD = 10**9 + 7

        def kadanes(nums):

            best = 0
            total = 0
            for x in nums:
                total += x
                if total < 0:
                    total = 0
                best = max(best, total)
            return best

        best = 0

        if k <= 3:
            return (kadanes(arr * k)) % MOD

        s = max(0, (sum(arr) * (k - 1))) % MOD
        return max(s + kadanes(arr), kadanes(arr * 2))
