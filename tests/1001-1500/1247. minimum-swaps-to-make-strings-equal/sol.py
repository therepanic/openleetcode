class Solution:
    def minimumSwap(self, s1: str, s2: str) -> int:
        n = len(s1)
        s1_x = 0
        s1_y = 0
        for i in range(n):
            if s1[i] == s2[i]:
                continue
            if s1[i] == "x":
                s1_x += 1
            else:
                s1_y += 1

        if s1_x % 2 != s1_y % 2:
            return -1

        swaps = s1_x // 2 + s1_y // 2
        return swaps if s1_x % 2 == 0 else swaps + 2
