class Solution:
    def largestNumber(self, nums: List[int]) -> str:
        # Convert all integers to strings once.
        arr = list(map(str, nums))

        # Python sort needs a key, so we use cmp_to_key for custom comparison.
        # For two strings a and b:
        # - If a+b is larger than b+a, a should come first.
        # - Else b should come first.
        from functools import cmp_to_key

        def cmp(a: str, b: str) -> int:
            ab = a + b
            ba = b + a
            if ab > ba:
                return -1
            if ab < ba:
                return 1
            return 0

        arr.sort(key=cmp_to_key(cmp))

        # Edge case: if the largest piece is "0", all are zeros.
        if arr[0] == "0":
            return "0"

        # Join once for linear-time string build.
        return "".join(arr)
