class Solution:
    def findLexSmallestString(self, s: str, a: int, b: int) -> str:
        n = len(s)
        # this map holds the new value of every digit after addition by a % 10
        incremented = {str(n): str((n + a) % 10) for n in range(10)}

        # function applying the addition operation
        def addOp(s):
            res = ""
            for i in range(n):
                res += s[i] if i % 2 == 0 else incremented[s[i]]
            return res

        # function applying the rotation operation
        def rotOp(s):
            return s[n - b :] + s[: n - b]

        seen = set()

        def dfs(s):
            if s in seen:
                return
            seen.add(s)
            dfs(addOp(s))
            dfs(rotOp(s))
            return

        dfs(s)
        return min(seen)
