class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:

        ans = []

        def solve(idx, curr):

            if idx == len(s):
                ans.append(curr)
                return

            if s[idx].isdigit():
                solve(idx + 1, curr + s[idx])
                return

            solve(idx + 1, curr + s[idx].lower())
            solve(idx + 1, curr + s[idx].upper())

        solve(0, "")

        return ans
