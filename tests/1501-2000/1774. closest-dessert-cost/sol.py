from bisect import bisect


class Solution:
    def closestCost(
        self, baseCosts: List[int], toppingCosts: List[int], target: int
    ) -> int:
        b = baseCosts
        t = toppingCosts
        s = [0]
        for i in t:
            ss = []
            for j in s:
                ss += [j, j + i, j + 2 * i]
            s = ss
        s.sort()
        ans = 10**10
        fans = 10**10
        n = len(s)
        for i in b:
            j = target - i
            x = bisect(s, j) - 1
            x = max(x, 0)
            ans1 = abs(j - s[x])
            if ans1 < ans:
                ans = ans1
                fans = s[x] + i
            elif ans1 == ans:
                fans = min(fans, s[x] + i)
            if x + 1 < n:
                x += 1
            ans1 = abs(j - s[x])
            if ans1 < ans:
                ans = ans1
                fans = s[x] + i
            elif ans1 == ans:
                fans = min(fans, s[x] + i)
        return fans
