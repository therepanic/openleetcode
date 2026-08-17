class Solution(object):
    def sumGame(self, num):
        """
        :type num: str
        :rtype: bool
        """
        n = len(num)
        half = n // 2
        sum_left = sum_right = 0
        q_left = q_right = 0

        for i in range(half):
            if num[i] == "?":
                q_left += 1
            else:
                sum_left += int(num[i])

        for i in range(half, n):
            if num[i] == "?":
                q_right += 1
            else:
                sum_right += int(num[i])

        return (sum_left - sum_right) * 2 != (q_right - q_left) * 9
