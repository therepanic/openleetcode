import bisect


class Solution:
    def maxEnvelopes(self, envelopes: List[List[int]]) -> int:
        envelopes.sort(key=lambda x: (x[0], -x[1]))
        result = []
        for s, e in envelopes:
            idx = bisect.bisect_left(result, e)
            if idx == len(result):
                result.append(e)
            else:
                result[idx] = e
        return len(result)
