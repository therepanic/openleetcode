class Solution:
    def reachNumber(self, target: int) -> int:
        target = abs(target)
        n = int((-1 + (1 + 8 * target) ** 0.5) // 2)
        a = n * (n + 1) // 2
        b = a + n + 1

        if a == target:
            return n
        if (b - target) % 2 == 0:
            return n + 1
        return n + 2 if (n + 2) % 2 == 1 else n + 3
