class Solution:
    def getLucky(self, s: str, k: int) -> int:
        res = ""

        for c in s:
            res += str(ord(c) - ord("a") + 1)

        for i in range(k):
            res = str(sum([int(c) for c in res]))
        return int(res)
