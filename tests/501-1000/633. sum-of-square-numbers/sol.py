import math


class Solution(object):
    def judgeSquareSum(self, c):
        left = 0
        right = int(math.sqrt(c))
        while left <= right:
            current_sum = left * left + right * right
            if current_sum == c:
                return True
            elif current_sum < c:
                left += 1
            else:
                right -= 1
        return False
