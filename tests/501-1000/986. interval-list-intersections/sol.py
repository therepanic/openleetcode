from typing import List


class Solution:
    def intervalIntersection(
        self, firstList: List[List[int]], secondList: List[List[int]]
    ) -> List[List[int]]:

        if not firstList or not secondList:
            return []

        n, m = len(firstList), len(secondList)
        res = []
        i = j = 0

        while i < n and j < m:
            s1, e1 = firstList[
                i
            ]  # Unpack to flat variables — reduces index lookup overhead
            s2, e2 = secondList[j]

            if e1 >= s2 and s1 <= e2:  # Explicit overlap check
                res.append(
                    [max(s1, s2), min(e1, e2)]
                )  # Intersection = [latest start, earliest end]

            if e1 > e2:  # Advance the interval that ends first
                j += 1
            else:
                i += 1

        return res
