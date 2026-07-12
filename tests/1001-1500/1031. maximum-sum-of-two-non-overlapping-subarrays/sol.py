from typing import List


class Solution:
    def maxSumTwoNoOverlap(self, nums: List[int], firstLen: int, secondLen: int) -> int:
        def solve(a: int, b: int) -> int:
            n = len(nums)
            prefix = [0] * (n + 1)
            for i in range(n):
                prefix[i + 1] = prefix[i] + nums[i]
            best_a = prefix[a]
            ans = 0
            for end in range(a + b, n + 1):
                best_a = max(best_a, prefix[end - b] - prefix[end - b - a])
                ans = max(ans, best_a + prefix[end] - prefix[end - b])
            return ans

        return max(solve(firstLen, secondLen), solve(secondLen, firstLen))
