class Solution:
    def winnerOfGame(self, colors: str) -> bool:
        a, b = 0, 0
        idx = 0
        n = len(colors)
        while idx < n:
            j = idx
            ch = colors[idx]
            while j < n and colors[j] == ch:
                j += 1
            if ch == 'A' and j - idx >= 3:
                a += j - idx - 2
            elif ch == 'B' and j - idx >= 3:
                b += j - idx - 2
            idx = j
        return a > b