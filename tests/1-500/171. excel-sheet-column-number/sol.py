class Solution:
    def titleToNumber(self, columnTitle: str) -> int:
        ans = 0

        # Read left to right like normal positional numbers.
        for ch in columnTitle:
            # Shift existing value one base-26 place to the left,
            # then add current letter value (A=1 ... Z=26).
            ans = ans * 26 + (ord(ch) - ord("A") + 1)

        return ans
