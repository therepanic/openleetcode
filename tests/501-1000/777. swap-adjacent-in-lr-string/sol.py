class Solution:
    def canTransform(self, start: str, result: str) -> bool:
        n = len(start)
        i = j = 0

        while i < n or j < n:
            while i < n and start[i] == "X":
                i += 1
            while j < n and result[j] == "X":
                j += 1

            if (i == n) ^ (j == n):
                return False

            if i < n and j < n:
                if start[i] != result[j]:
                    return False

                if start[i] == "L" and j > i:
                    return False

                if start[i] == "R" and j < i:
                    return False

            i += 1
            j += 1

        return True
