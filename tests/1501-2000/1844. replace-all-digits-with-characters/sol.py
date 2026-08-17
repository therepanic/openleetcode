class Solution:
    def replaceDigits(self, s: str) -> str:
        s = list(s)

        for i in range(1, len(s), 2):
            ch = s[i - 1]
            digit = int(s[i])

            s[i] = chr(ord(ch) + digit)

        return "".join(s)
