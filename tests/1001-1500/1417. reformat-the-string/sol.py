class Solution:
    def reformat(self, s):
        digits = [c for c in s if c.isdigit()]
        letters = [c for c in s if c.isalpha()]
        if abs(len(digits) - len(letters)) >= 2:
            return ""
        ans = []
        if len(digits) > len(letters):
            ans = [None] * (len(s))
            ans[::2] = digits
            ans[1::2] = letters
        else:
            ans = [None] * (len(s))
            ans[::2] = letters
            ans[1::2] = digits
        return "".join(ans)
