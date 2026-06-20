class Solution:
    def partition(self, s: str) -> List[List[str]]:
        self.n = len(s)
        res = []
        self.backtrack(s, 0, [], res)
        return res

    def backtrack(self, s, idx, path, res):
        if idx == self.n:
            res.append(path[:])
            return

        for i in range(idx, len(s)):
            if self.is_palindrome(s, idx, i):
                path.append(s[idx : i + 1])
                self.backtrack(s, i + 1, path, res)
                path.pop()

    def is_palindrome(self, s, l, r):
        while l < r:
            if s[l] != s[r]:
                return False
            l += 1
            r -= 1
        return True
