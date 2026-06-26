class Solution(object):
    def checkRecord(self, s):
        a_count = 0
        l_streak = 0

        for c in s:
            if c == "A":
                a_count += 1
                if a_count >= 2:
                    return False
            if c == "L":
                l_streak += 1
                if l_streak >= 3:
                    return False
            else:
                l_streak = 0

        return True
