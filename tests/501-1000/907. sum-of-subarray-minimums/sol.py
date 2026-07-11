class Solution:
    def sumSubarrayMins(self, arr: List[int]) -> int:
        stack = []  # keep index for the latest smaller values
        res = [0] * len(arr)

        for i in range(len(arr)):
            while stack and arr[stack[-1]] > arr[i]:
                stack.pop()

            j = stack[-1] if stack else -1
            res[i] = res[j] + (i - j) * arr[i]

            stack.append(i)

        return sum(res) % (10**9 + 7)
