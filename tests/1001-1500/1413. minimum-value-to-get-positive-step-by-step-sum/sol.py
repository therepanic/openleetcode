class Solution:
    def minStartValue(self, nums: List[int]) -> int:
        curr = ans = 0
        for i in nums:
            curr += i
            if curr < ans:
                ans = curr
        return max(ans, 1 - ans)
