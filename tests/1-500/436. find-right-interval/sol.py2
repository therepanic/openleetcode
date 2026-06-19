class Solution(object):
    def findRightInterval(self, intervals):
        starts = [(interval[0], i) for i, interval in enumerate(intervals)]
        starts.sort()
        res = []
        for interval in intervals:
            end = interval[1]
            left, right = 0, len(starts) - 1
            idx = -1
            while left <= right:
                mid = (left + right) // 2
                if starts[mid][0] >= end:
                    idx = starts[mid][1]
                    right = mid - 1
                else:
                    left = mid + 1
            res.append(idx)
        return res
