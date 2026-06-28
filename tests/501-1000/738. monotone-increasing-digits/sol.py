class Solution(object):
    def monotoneIncreasingDigits(self, n):
        s = list(str(n))
        mark = len(s)
        for i in range(len(s) - 1, 0, -1):
            if s[i] < s[i - 1]:
                s[i - 1] = str(int(s[i - 1]) - 1)
                mark = i
        for i in range(mark, len(s)):
            s[i] = "9"
        return int("".join(s))
