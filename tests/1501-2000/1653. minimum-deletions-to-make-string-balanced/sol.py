class Solution:
    def minimumDeletions(self, s: str) -> int:
        res = 0
        count = 0
        for ch in s:
            if ch == "b":
                count += 1
            elif count:
                res += 1
                count -= 1

        return res
