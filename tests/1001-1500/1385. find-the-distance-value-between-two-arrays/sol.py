from typing import List
import bisect


class Solution:
    def findTheDistanceValue(self, arr1: List[int], arr2: List[int], d: int) -> int:
        arr2.sort()
        count = 0

        for num in arr1:
            left_index = bisect.bisect_left(arr2, num - d)
            right_index = bisect.bisect_right(arr2, num + d)

            if left_index == right_index:
                count += 1

        return count
