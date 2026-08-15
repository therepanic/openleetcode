import bisect


class Solution:
    def minimumEffort(self, tasks: list[list[int]]) -> int:
        tasks.sort(key=lambda x: x[1] - x[0], reverse=True)

        def test(bal):
            for cost, thresh in tasks:
                if bal < thresh:
                    return False
                bal -= cost
            return True

        return bisect.bisect_left(range(10**9 + 1), True, key=test)
