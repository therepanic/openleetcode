class Solution(object):
    def countSegments(self, s):
        c = 0
        for i in range(len(s)):
            if s[i] != ' ' and (i == 0 or s[i - 1] == ' '):
                c += 1
        return c
