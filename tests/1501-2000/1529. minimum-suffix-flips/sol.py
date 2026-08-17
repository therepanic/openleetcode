class Solution:
    def minFlips(self, target: str) -> int:
        minCount = 0
        flag = 0
        n = len(target)

        for i in range(n):
            if target[i] != chr(flag % 2 + ord("0")):
                minCount += 1
                flag += 1

        return minCount
