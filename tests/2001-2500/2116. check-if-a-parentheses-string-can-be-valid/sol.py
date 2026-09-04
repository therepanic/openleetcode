class Solution:
    def canBeValid(self, s: str, locked: str) -> bool:
        n = len(s)
        if n % 2 != 0:
            return False

        open_count = 0
        for i in range(n):
            if s[i] == '(' or locked[i] == '0':
                open_count += 1
            else:
                open_count -= 1
            if open_count < 0:
                return False

        close_count = 0
        for i in range(n - 1, -1, -1):
            if s[i] == ')' or locked[i] == '0':
                close_count += 1
            else:
                close_count -= 1
            if close_count < 0:
                return False

        return True