class Solution:
    def prefixesDivBy5(self, nums):
        ans = []
        val = 0
        for bit in nums:
            val = (val * 2 + bit) % 5
            ans.append(val == 0)
        return ans
