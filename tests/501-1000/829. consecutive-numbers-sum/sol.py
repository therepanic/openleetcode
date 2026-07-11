class Solution:
    def consecutiveNumbersSum(self, n: int) -> int:

        maxSequenceLength = math.floor((math.sqrt(1 + 8 * n) - 1) / 2)
        c = 0
        for i in range(2, maxSequenceLength + 1):
            if i % 2 == 1 and n % i == 0:
                c += 1
            elif i % 2 == 0 and n % i == i // 2:
                c += 1

        return c + 1
