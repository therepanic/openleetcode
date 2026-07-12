class Solution:
    def queryString(self, s: str, n: int) -> bool:
        for num in range(n, 0, -1):
            target = bin(num)[2:]
            length = len(target)
            left = 0
            valid = False
            for right in range(len(s)):
                while right - left + 1 > length:
                    left += 1

                if s[left : right + 1] == target:
                    valid = True
                    break

            if not valid:
                return False
        return True
