class Solution:
    def findLengthOfShortestSubarray(self, arr):
        n = len(arr)
        right = n - 1
        while right > 0 and arr[right - 1] <= arr[right]:
            right -= 1
        if right == 0:
            return 0
        answer = right
        left = 0
        while left == 0 or (left < n and arr[left - 1] <= arr[left]):
            while right < n and arr[left] > arr[right]:
                right += 1
            answer = min(answer, right - left - 1)
            left += 1
            if left >= n:
                break
        return answer
