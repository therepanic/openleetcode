class Solution(object):
    def maxPower(self, s):
        maxcnt = 0
        cnt = 0

        for i in range(1, len(s)):
            if s[i] == s[i - 1]:
                cnt += 1

            else:
                cnt = 0
            maxcnt = max(cnt, maxcnt)
        return maxcnt + 1
