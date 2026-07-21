from typing import List


class Solution(object):
    def numTimesAllBlue(self, flips):
        """
        :type flips: List[int]
        :rtype: int
        """
        res = 0
        max_flips = 0

        for i in range(len(flips)):
            max_flips = max(max_flips, flips[i])
            if max_flips == i + 1:
                res += 1

        return res
