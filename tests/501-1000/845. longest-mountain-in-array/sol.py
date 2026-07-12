from typing import List


class Solution:
    def longestMountain(self, arr: List[int]) -> int:
        n = len(arr)
        best = 0
        i = 1

        while i < n - 1:
            if arr[i - 1] < arr[i] > arr[i + 1]:
                left = i - 1
                right = i + 1
                while left > 0 and arr[left - 1] < arr[left]:
                    left -= 1
                while right < n - 1 and arr[right] > arr[right + 1]:
                    right += 1
                best = max(best, right - left + 1)
                i = right
            i += 1

        return best
