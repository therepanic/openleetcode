class Solution:
    def minSumOfLengths(self, arr: List[int], target: int) -> int:
        n = len(arr)
        best_left = [n] * n
        min_total = float("inf")
        left = 0
        curr = 0
        for right, val in enumerate(arr):
            curr += val
            while curr > target:
                curr -= arr[left]
                left += 1
            if curr == target:
                length = right - left + 1
                best_left[right] = min(best_left[right - 1], length)
                if left > 0 and best_left[left - 1] != n:
                    min_total = min(min_total, best_left[left - 1] + length)

            else:
                best_left[right] = best_left[right - 1]
        return min_total if min_total != float("inf") else -1
