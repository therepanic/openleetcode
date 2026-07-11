from typing import List


class Solution:
    def validMountainArray(self, arr: List[int]) -> bool:
        n = len(arr)
        i = 0

        # 1. Climb up
        while i + 1 < n and arr[i] < arr[i + 1]:
            i += 1

        # 2. Peak check: Peak can't be first or last element
        if i == 0 or i == n - 1:
            return False

        # 3. Climb down
        while i + 1 < n and arr[i] > arr[i + 1]:
            i += 1

        # 4. If we reached the end, it's a mountain
        return i == n - 1
