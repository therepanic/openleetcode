class Solution:
    def countAndSay(self, n):
        if n == 1:
            return "1"
        prev = self.countAndSay(n - 1)
        res, i = "", 0
        while i < len(prev):
            count = 1
            while i + 1 < len(prev) and prev[i] == prev[i + 1]:
                i += 1
                count += 1
            res += str(count) + prev[i]
            i += 1
        return res
