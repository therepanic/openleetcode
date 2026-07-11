class Solution(object):
    def pancakeSort(self, arr):
        n = len(arr)
        result = []

        # Iteratively place the largest unsorted values at their correct positions
        for i in range(n):
            target = n - i
            position = 0

            # Find the current target value's index within the unsorted range
            for j in range(n - i):
                if arr[j] == target:
                    position = j
                    break

            # Case 1: If the target element is already in place, skip flipping
            if position == n - i - 1:
                continue

            # Case 2: Bring the target element to the front of the array
            if position > 0:
                result.append(position + 1)
                arr[: position + 1] = arr[: position + 1][::-1]

            # Case 3: Flip it down to its correct final position at the bottom
            result.append(n - i)
            arr[: n - i] = arr[: n - i][::-1]

        return result
