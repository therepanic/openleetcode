class Solution:
    def reverseParentheses(self, s: str) -> str:
        self.i: int = 0
        return self.helper(s)

    def helper(self, s: str) -> str:
        size: int = len(s)
        ans: str = ""

        while self.i < size:
            if s[self.i] == "(":
                self.i += 1
                ans += self.helper(s)
            elif s[self.i] == ")":
                self.i += 1
                return self.rev(ans)
            else:
                ans += s[self.i]
                self.i += 1

        return ans

    def rev(self, s: str) -> str:
        r: str = ""
        for i in range(0, len(s)):
            r = s[i] + r

        return r
