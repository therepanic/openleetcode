class Solution:
    def strangePrinter(self, s: str) -> int:
        memo = {}

        def min_turns_to_print(start, end):
            if start > end:
                return 0

            if (start, end) in memo:
                return memo[(start, end)]

            res = min_turns_to_print(start, end - 1) + 1

            for middle in range(start, end):
                if s[middle] == s[end]:
                    res = min(
                        res,
                        min_turns_to_print(start, middle)
                        + min_turns_to_print(middle + 1, end - 1),
                    )

            memo[(start, end)] = res
            return res

        return min_turns_to_print(0, len(s) - 1)
