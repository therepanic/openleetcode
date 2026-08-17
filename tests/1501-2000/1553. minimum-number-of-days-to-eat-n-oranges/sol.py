class Solution:
    def minDays(self, n: int) -> int:
        ans = 0
        queue = [n]
        seen = set()
        while queue:  # bfs
            newq = []
            for x in queue:
                if x == 0:
                    return ans
                seen.add(x)
                if x - 1 not in seen:
                    newq.append(x - 1)
                if x % 2 == 0 and x // 2 not in seen:
                    newq.append(x // 2)
                if x % 3 == 0 and x // 3 not in seen:
                    newq.append(x // 3)
            ans += 1
            queue = newq
