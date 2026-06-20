def fun(s, dc, memo):
    if s in memo:
        return memo[s]
    ans = []
    if dc[s] == 1:
        ans = [s]
    for i in range(1, len(s)):
        if dc[s[:i]] == 1:
            a = fun(s[i:], dc, memo)
            for x in a:
                ans.append(s[:i] + " " + x)
    memo[s] = ans
    return ans


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> List[str]:
        dc = defaultdict(lambda: 0)
        for a in wordDict:
            dc[a] = 1
        return fun(s, dc, {})
