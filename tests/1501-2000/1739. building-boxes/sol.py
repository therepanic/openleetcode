class Solution:
    def minimumBoxes(self, n: int) -> int:
        x = int((6.0 * n) ** (1.0 / 3.0))
        while (x + 1) * (x + 2) * (x + 3) <= 6 * n:
            x += 1
        while x * (x + 1) * (x + 2) > 6 * n:
            x -= 1

        ans = x * (x + 1) // 2
        n -= x * (x + 1) * (x + 2) // 6
        k = 1
        while n > 0:
            ans += 1
            n -= k
            k += 1
        return ans
