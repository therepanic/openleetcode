class Solution(object):
    def maximumGain(self, s, x, y):
        """
        :type s: str
        :type x: int
        :type y: int
        :rtype: int
        """
        score = 0
        ch1, ch2 = 'a', 'b'
        cnt1 = cnt2 = 0

        if x < y:
            x, y = y, x
            ch1, ch2 = 'b', 'a'

        for ch in s:
            if ch == ch1:
                cnt1 += 1
            elif ch == ch2:
                if cnt1 > 0:
                    cnt1 -= 1
                    score += x
                else:
                    cnt2 += 1
            else:
                score += min(cnt1, cnt2) * y
                cnt1 = cnt2 = 0

        if cnt1 != 0:
            score += min(cnt1, cnt2) * y

        return score
