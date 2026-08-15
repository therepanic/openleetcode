class Solution(object):
    def minimumJumps(self, forbidden, a, b, x):
        """
        :type forbidden: List[int]
        :type a: int
        :type b: int
        :type x: int
        :rtype: int
        """
        idx = 1
        for i in range(2, min(a, b) + 1):
            if a % i == 0 and b % i == 0:
                idx = i
        if x % idx != 0:
            return -1
        q = deque([])
        q.append([0, 1, 0])
        visited = set()
        visited.add(0)
        not_allowed = set(forbidden)
        visited = visited.union(not_allowed)
        top = max(forbidden)
        while q:
            curr, prev, step = q.popleft()
            if curr == x:
                return step
            if prev == 1:
                if curr - b >= 0 and curr - b not in visited:
                    visited.add(curr - b)
                    q.append([curr - b, -1, step + 1])
            if curr + a not in visited and curr + a <= max(top, x) + a + b:
                visited.add(curr + a)
                q.append([curr + a, 1, step + 1])
        return -1
