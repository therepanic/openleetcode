class Solution:
    def balancedStringSplit(self, s: str) -> int:
        Bal = 0
        count = 0
        for i in range(len(s)):
            if s[i] == "L":
                Bal += 1
            elif s[i] == "R":
                Bal -= 1
            if Bal == 0:
                count += 1
        return count
