class Solution:
    def removeOuterParentheses(self, s: str) -> str:
        res = []
        balance = 0
        start = 0

        for i, ch in enumerate(s):
            if ch == "(":
                balance += 1
            else:
                balance -= 1
            if balance == 0:
                res.append(s[start + 1 : i])
                start = i + 1
        return "".join(res)
