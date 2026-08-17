class Solution:
    def maxDepth(self, s: str) -> int:
        ctr = 0
        ans = 0
        for i in s:
            if i == "(":
                ctr += 1
                ans = max(ans, ctr)
            elif i == ")":
                ctr -= 1
        return ans
