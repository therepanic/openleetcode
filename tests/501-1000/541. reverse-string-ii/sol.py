class Solution:
    def reverseStr(self, s: str, k: int) -> str:

        arr = list(s)
        step = 2 * k

        for i in range(0, len(arr), step):
            start = i
            end = min(i + k - 1, len(arr) - 1)

            while start < end:
                arr[start], arr[end] = arr[end], arr[start]
                start += 1
                end -= 1

        return "".join(arr)
