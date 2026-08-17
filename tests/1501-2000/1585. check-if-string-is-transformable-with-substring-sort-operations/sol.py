class Solution:
    def isTransformable(self, s: str, t: str) -> bool:
        if sorted(s) != sorted(t):
            return False  # edge case

        pos = [deque() for _ in range(10)]
        for i, ss in enumerate(s):
            pos[int(ss)].append(i)

        for tt in t:
            i = pos[int(tt)].popleft()
            for ii in range(int(tt)):
                if pos[ii] and pos[ii][0] < i:
                    return False  # cannot swap
        return True
