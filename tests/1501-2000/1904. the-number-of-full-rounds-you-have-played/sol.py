class Solution(object):
    def numberOfRounds(self, loginTime, logoutTime):
        """
        :type loginTime: str
        :type logoutTime: str
        :rtype: int
        """

        def to_minutes(t):
            h, m = map(int, t.split(":"))
            return h * 60 + m

        start = to_minutes(loginTime)
        end = to_minutes(logoutTime)

        if end < start:
            end += 24 * 60

        start_round = (start + 14) // 15
        end_round = end // 15

        return max(0, end_round - start_round)
