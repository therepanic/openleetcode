class Solution:
    """
    Time Complexity: O(n) where n is the length of string s
    - We iterate through the string twice, each taking O(n) time

    Space Complexity: O(1)
    - We only use a constant amount of extra space regardless of input size
    - No additional data structures that scale with input
    """

    def minFlipsMonoIncr(self, s: str) -> int:
        zeroes = 0
        ones = 0

        # First pass: count total zeroes
        for ch in s:
            if ch == "0":
                zeroes += 1

        output = zeroes  # Initialize with flipping all zeroes to ones

        # Second pass: find minimum flips needed
        for ch in s:
            if ch == "0":
                zeroes -= (
                    1  # One less zero to flip if we include this position in prefix
                )
            elif ch == "1":
                ones += 1  # Need to flip this one to zero if in prefix
            output = min(output, zeroes + ones)

        return output
