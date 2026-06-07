class Solution:
    def generate(self, ans: list[str], s: str, open: int, close: int, n: int) -> None:
        if open == n and close == n:
            ans.append(s)
            return
        if open > close:
            self.generate(ans, s + ")", open, close + 1, n)
        if open < n:
            self.generate(ans, s + "(", open + 1, close, n)

    def generateParenthesis(self, n: int) -> list[str]:
        ans: list[str] = []
        self.generate(ans, "", 0, 0, n)
        return ans