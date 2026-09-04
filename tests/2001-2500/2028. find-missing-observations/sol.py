class Solution:
    def missingRolls(self, rolls: List[int], mean: int, n: int) -> List[int]:
        m = len(rolls)
        missing_sum = mean * (m + n) - sum(rolls)
        res = [0] * n
        while missing_sum >= n:
            res = [res[0]+1]*n
            missing_sum -= n
        for i in range(missing_sum): res[i] += 1
        return [] if res[0] > 6 or 0 in res else res